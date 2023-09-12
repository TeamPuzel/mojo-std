
fn spacer(): print("")

fn red():
    print_no_newline(chr(27))
    print_no_newline("[31m")

fn blue():
    print_no_newline(chr(27))
    print_no_newline("[34m")

fn green():
    print_no_newline(chr(27))
    print_no_newline("[32m")

fn reset():
    print_no_newline(chr(27))
    print_no_newline("[0m")

fn test_name(str: String):
    blue()
    print("\n--- " + str + " ---")
    reset()