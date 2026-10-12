
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
