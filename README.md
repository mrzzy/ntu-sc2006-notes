# NTU SC2006 Software Engineering Notes

Notes on NTU's SC2006 Software Engineering module:

- [PDF](https://mrzzy.github.io/ntu-sc2006-notes/pdf/document.pdf)
- [HTML](https://mrzzy.github.io/ntu-sc2006-notes)

## Project Structure

```
docs/
    index.md          # Note index.
    topic/
        concept.md    # Notes for a topic.
        subtopic/
            concept.md  # Notes for a subtopic.
```

## Contributing

Contributions are welcome! Follow these steps to add or update notes:

## Quickstart

1. Clone the repository:

   ```bash
   git clone https://github.com/mrzzy/ntu-sc2006-notes.git
   cd ntu-sc2006-notes
   ```

2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

3. Start the local server:

   ```bash
   mkdocs serve
   ```

4. Preview the notes at `http://127.0.0.1:8000/`.

5. Generate the site and export a PDF:

   ```bash
   mkdocs build
   ```

   The generated PDF is located at `site/pdf/document.pdf`.

### Add a New Note

06. **Create a Markdown File:**

    - Place your file under the relevant folder in `docs/`.
    - Add a `title` field in the YAML metadata at the top of the file.\
      Example:
      ```yaml
      ---
      title: Singleton Pattern
      ---
      ```

07. **Organize by Folder:**

    - Group related topics and subtopics:
      ```
      docs/
          design-patterns/
              singleton.md
              observer.md
      ```

08. **Run Formatting and Spelling Checks:**

    - Format Markdown files using [`mdformat`](https://github.com/executablebooks/mdformat):
      ```bash
      mdformat .
      ```
    - Check for and fix common spelling errors using [`codespell`](https://github.com/codespell-project/codespell):
      ```bash
      codespell
      ```

09. **Preview Locally:**

    - Run `mkdocs serve` to ensure everything looks correct.
      > **Disable PDF Output (Optional):**
      > If working on content unrelated to PDF generation, disable the PDF plugin by commenting it out in `mkdocs.yml` to speed things up:
      ```yaml
      # - with-pdf:
      #     cover_subtitle: NTU SC2006 Software Engineering Notes
      #     copyright: "&copy; SC2006 Docs Team"
      ```

10. **Submit a Pull Request:**

    - Commit and push changes:
      ```bash
      git checkout -b add-notes
      git commit -am "Add notes on Singleton Pattern"
      git push origin add-notes
      ```
    - Open a pull request and describe your changes.

## License

See the [LICENSE](LICENSE) file for details.
