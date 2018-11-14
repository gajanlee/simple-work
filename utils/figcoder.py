"""
    This file is used to convert pictures to base64 format and output to a text file for makdown figures insertion.
"""
import argparse
import base64

__author__ = "Gajanlee"

parse = argparse.ArgumentParser()
parse.add_argument("--figs", help="figs' path", nargs="+", required=True)
parse.add_argument("--prefix", help="generate tag name's prefix", default="pic", type=str)

def code_fig(path):
    print(path)
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()

def output(data, path="pic_base64.txt", prefix="pic"):
    print(prefix, len(data))
    with open(path, "w") as f:
        for i, code in enumerate(data, 1):
            f.write("[{prefix}{num}]:data:image/png;base64,{code}\n".format(prefix=prefix, num=i, code=code))

if __name__ == "__main__":
    args = parse.parse_args()
    output([code_fig(file) for file in args.figs], prefix=args.prefix)


