import re
import sys


def generate_instantiation(verilog_text):
    verilog_text = re.sub(r"//.*", "", verilog_text)
    verilog_text = re.sub(r"/\*.*?\*/", "", verilog_text, flags=re.S)

    module_match = re.search(r"\bmodule\s+(\w+)", verilog_text)
    if not module_match:
        raise ValueError("No module found")

    module_name = module_match.group(1)

    param_block = re.search(r"#\s*\((.*?)\)\s*\(", verilog_text, flags=re.S)

    params = []
    if param_block:
        for line in param_block.group(1).split(","):
            line = line.strip()
            if not line:
                continue
            m = re.search(r"parameter\s+(\w+)", line)
            if m:
                params.append(m.group(1))

    port_block = re.search(r"\(\s*(.*?)\s*\)\s*;", verilog_text, flags=re.S)

    ports = []
    if port_block:
        for line in port_block.group(1).split(","):
            line = line.strip()
            if not line:
                continue
            name = re.findall(r"(\w+)\s*$", line)
            if name:
                ports.append(name[0])

    print(f"{module_name} #(")
    for i, p in enumerate(params):
        comma = "," if i < len(params) - 1 else ""
        print(f"    .{p}(){comma}")
    print(f") {module_name}_inst (")

    for i, port in enumerate(ports):
        comma = "," if i < len(ports) - 1 else ""
        print(f"    .{port}(){comma}")

    print(");")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python verilog_inst_gen.py <verilog_file.v>")
        sys.exit(1)

    with open(sys.argv[1], "r") as f:
        verilog_text = f.read()

    generate_instantiation(verilog_text)
