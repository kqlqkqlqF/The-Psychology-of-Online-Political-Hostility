## Overview

This repo is for the paper "The Psychology of Online Political Hostility -- How Aggressiveness of People Effects Their Online and Offline Comment Towards Political Incidents". This article was replicated from the article "The Psychology of Online Political Hostility -- A Comprehensive, Cross-National Test of the Mismatch Hypothesis" by Bor Alexander and Michael Bang Petersen in 2021, the doi for the original paper is 10.1017/S0003055421000885.

If you want to replicate this paper, please click on the green button on the right and press "download zip". It is important to keep the original file structure while you are running the code. Otherwise, the code will be leaded to a wrong directory and error might emerge.

## File Structure

The repo is structured as:

-   `data` contains all kinds of data used in this research. including `analysis_data`, `raw_data`, and `simulated_data`.
-   `other` contains `literature`, which includes all literature referenced in this paper; `llm`, which contain the LLM statement; and `sketches`, which are the figures we drawn for a pre-sketch. 
-   `paper` contains the qmd document used to generate the paper,the pdf document of paper, and the reference bibliography file. 
-   `scripts` contains the R scripts used to simulate, clean, test and replicate data.

## Statement on LLM usage

Statement on LLM usage: Aspects of the code were written with the help of the autocomplete tool, Chat-GPT3.5. Some part of figure caption and discussion was written with the help of Chat-GPT3.5 and the entire chat history is available at others/llm/usage.txt.
