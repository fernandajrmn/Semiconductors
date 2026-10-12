#!/usr/bin/env python3

import sys
import os
import numpy as np

WIDTH = 256
HEIGHT = 256


def load_raw(filename):
    image = np.fromfile(filename, dtype=np.uint8)

    expected = WIDTH * HEIGHT
    if image.size != expected:
        raise ValueError(
            f"{filename}: expected {expected} pixels "
            f"({WIDTH}x{HEIGHT}), but found {image.size}."
        )

    return image.reshape((HEIGHT, WIDTH))


def load_pgm(filename):
    with open(filename, "rb") as f:
        magic = f.readline().strip()

        if magic not in (b"P2", b"P5"):
            raise ValueError(f"{filename}: unsupported PGM format {magic!r}")

        header_tokens = []

        while len(header_tokens) < 3:
            line = f.readline()

            if not line:
                raise ValueError(f"{filename}: incomplete PGM header.")

            line = line.split(b"#", 1)[0]
            header_tokens.extend(line.split())

        width = int(header_tokens[0])
        height = int(header_tokens[1])
        max_value = int(header_tokens[2])

        if width != WIDTH or height != HEIGHT:
            raise ValueError(
                f"{filename}: image is {width}x{height}, "
                f"expected {WIDTH}x{HEIGHT}."
            )

        if max_value > 255:
            raise ValueError(
                f"{filename}: max value is {max_value}; "
                "this script expects 8-bit pixels."
            )

        if magic == b"P2":
            rest = f.read().decode("ascii")
            tokens = []

            for line in rest.splitlines():
                line = line.split("#", 1)[0]
                tokens.extend(line.split())

            pixels = np.array([int(x) for x in tokens], dtype=np.uint8)

        else:
            pixels = np.frombuffer(f.read(), dtype=np.uint8)

        expected = WIDTH * HEIGHT

        if pixels.size < expected:
            raise ValueError(
                f"{filename}: expected {expected} pixels, "
                f"but found {pixels.size}."
            )

        return pixels[:expected].reshape((HEIGHT, WIDTH))


def load_image(filename):
    extension = os.path.splitext(filename)[1].lower()

    if extension == ".raw":
        return load_raw(filename)

    if extension == ".pgm":
        return load_pgm(filename)

    if extension in (".png", ".jpg", ".jpeg", ".bmp"):
        try:
            import cv2
        except ImportError:
            raise RuntimeError(
                f"{filename}: OpenCV is needed to read {extension} files. "
                "Use a .raw or .pgm version instead."
            )

        image = cv2.imread(filename, cv2.IMREAD_GRAYSCALE)

        if image is None:
            raise ValueError(f"Could not open {filename}.")

        if image.shape != (HEIGHT, WIDTH):
            raise ValueError(
                f"{filename}: image is {image.shape[1]}x{image.shape[0]}, "
                f"expected {WIDTH}x{HEIGHT}."
            )

        return image

    raise ValueError(
        f"{filename}: unsupported extension '{extension}'. "
        "Supported: .raw, .pgm, .png, .jpg, .jpeg, .bmp"
    )


def compare_images(name_a, image_a, name_b, image_b):
    differences = np.abs(
        image_a.astype(np.int16) -
        image_b.astype(np.int16)
    )

    different_mask = differences != 0
    different_pixels = int(np.count_nonzero(different_mask))
    max_difference = int(differences.max())
    mean_difference = float(differences.mean())

    print()
    print("=" * 68)
    print(f"{name_a}  VS  {name_b}")
    print("=" * 68)

    if different_pixels == 0:
        print("MATCH: the two images are exactly equal pixel by pixel.")
    else:
        print("NO MATCH")
        print(f"Different pixels : {different_pixels}")
        print(f"Total pixels     : {WIDTH * HEIGHT}")
        print(f"Max difference   : {max_difference}")
        print(f"Mean difference  : {mean_difference:.6f}")

        coordinates = np.argwhere(different_mask)

        print("\nFirst differences:")
        for y, x in coordinates[:10]:
            print(
                f"  (y={y}, x={x}) "
                f"{name_a}={image_a[y, x]}  "
                f"{name_b}={image_b[y, x]}  "
                f"diff={differences[y, x]}"
            )

    return different_pixels


def main():
    if len(sys.argv) != 4:
        print(
            "Usage:\n"
            "  python3 compare_sobel.py "
            "<python_image> <c_raw> <cpu_pgm>\n\n"
            "Example:\n"
            "  python3 compare_sobel.py "
            "lena_edge_py.raw lena_edge_c.raw Lena_sobel.pgm"
        )
        sys.exit(1)

    python_file = sys.argv[1]
    c_file = sys.argv[2]
    cpu_file = sys.argv[3]

    try:
        python_image = load_image(python_file)
        c_image = load_image(c_file)
        cpu_image = load_image(cpu_file)

    except (ValueError, RuntimeError, FileNotFoundError) as error:
        print(f"Error: {error}")
        sys.exit(1)

    print(f"Image size: {WIDTH}x{HEIGHT}")
    print(f"Python : {python_file}")
    print(f"C      : {c_file}")
    print(f"CPU RTL: {cpu_file}")

    py_vs_c = compare_images("Python", python_image, "C", c_image)
    py_vs_cpu = compare_images("Python", python_image, "CPU RTL", cpu_image)
    c_vs_cpu = compare_images("C", c_image, "CPU RTL", cpu_image)

    print()
    print("=" * 68)
    print("FINAL RESULT")
    print("=" * 68)

    if py_vs_c == 0 and py_vs_cpu == 0 and c_vs_cpu == 0:
        print("ALL MATCH: Python, C and CPU RTL produced the same image.")
    else:
        print("At least one implementation produced a different result.")


if __name__ == "__main__":
    main()
