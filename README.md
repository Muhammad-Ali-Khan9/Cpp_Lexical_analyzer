# C++ Lexical Analyzer 🛠️

A fast and efficient lexical analyzer built in C++ using **Flex**, **Yacc**, and **Bison**! 🎉 This tool reads source code and breaks it down into its basic components (tokens), making it an essential part of any compiler or interpreter development. 🚀

## Features 🌟

- **Tokenization** 🧩: Converts source code into tokens like keywords, identifiers, literals, operators, and more.
- **Efficient Parsing** ⚡: Utilizes C++ for high performance, minimizing overhead.
- **Built with Flex & Bison** 🔧: Uses **Flex** to generate the lexer and **Bison** to handle parsing for structured code analysis.
- **Easy to Extend** 🔄: Customize and add new token types or language features with minimal effort.

## Tools Used 🛠️

- **Flex** (Fast Lexical Analyzer) 🧵: Automatically generates the lexer based on regular expressions.
- **Bison** 📝: A parser generator, used here for syntax analysis to handle complex grammars.
- **Yacc** (Yet Another Compiler Compiler) 🖥️: Often used together with Bison for efficient parsing and grammar generation.

## How to Run the Lexical Analyzer 🚀

Follow these steps to build and run the lexical analyzer using **Flex**.

### 1. Clone the Repository

First, clone the repository:

```bash
git clone https://github.com/yourusername/cpp-lexical-analyzer.git
cd cpp-lexical-analyzer
```

### 2. Compile the Project Using Flex
Run the following script to compile and run the lexical analyzer using Flex and Bison (if applicable):

```bash
#!/bin/bash

# Step 1: Generate the lexer using Flex
flex lexer.l

# Step 2: Generate the parser using Bison (if you have a parser)
bison -d parser.y

# Step 3: Compile the lexer and parser with g++
g++ lex.yy.c parser.tab.c -o lexical_analyzer

echo "Build successful!"
```

You can also manually run these commands in your terminal:

```bash
# Generate the lexer code with Flex
flex lexer.l

# If you're using Bison for parsing, generate parser code
bison -d parser.y

# Compile the lexer and parser into an executable
g++ lex.yy.c parser.tab.c -o lexical_analyzer
```

### 3. Run the Lexical Analyzer
Once the build is complete, you can run the lexical analyzer with your C++ source file:
```bash
./lexical_analyzer <your_source_file.cpp>
```

For example:
```bash
./lexical_analyzer example.cpp
```

This will process example.cpp and output the tokenized version of the source file.
