+++
title = "Quick and easy data web apps in Python with Streamlit"
date = "2024-04-01"
draft = true

[extra]
comment = true

[taxonomies]
tags=["python"]
+++

I recently switched jobs (from one IT consultancy to another, smaller one).
This also meant switching client project, and subsequently I would be working with another tech stack than what I had been using the last few years.
I was going from microservices in csharp/.NET to "data apps" with Python, Pandas and Streamlit.

In order to prepare for the new project, I spent a week creating a [new hobby project](/projects/bike-count/) to play with the new tech stack.
I was surprised how little effort is needed to get from having a CSV file to having a working web application with interactive tables, charts and maps.
In this blog post I'll demonstrate how to get started with a data web app using Python, Pandas and Streamlit. It won't be very thorough.
If you want a deeper understanding, check out the official [streamlit.io/get-started](https://docs.streamlit.io/get-started) page.

### Setup / installation

0. Create and navigate to a new project directory

1. Create and activate a new Python virtual environment within the project directory

   ```bash
   python -m venv .venv
   . .venv/bin/activate
   ```

   > Note:
   > If you're using Linux and want to use another version of python than what `python` is installed/configured to be,
   > I have [some notes](https://notes.christianfosli.com/python.html#managing-multiple-python-versions-and-dependencies)

2. Install dependencies with pip

```bash
echo <<EOF > requirements.txt
streamlit~=1.32
pandas~=2.2
numpy~=1.26
EOF

pip install -r requirements.txt
```

### Create initial Streamlit app

TODO

### Dataframes

### Plots

### More
