"""
    This file is used to convert pictures to base64 format and output to a text file for makdown figures insertion.
"""
import argparse
import base64

__author__ = "Gajanlee"

parse = argparse.ArgumentParser()
parse.add_argument("--figs", help="figs' path", nargs="+", required=True)

def code_fig(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()

def output(data, path="pic_base64.txt"):
    with open(path, "w") as f:
        for i, code in enumerate(data, 1):
            f.writelines("[pic{num}]:data:image/png;base64,{code}".format(num=i, code=code))

if __name__ == "__main__":
    output([code_fig(file) for file in parse.parse_args().figs])


