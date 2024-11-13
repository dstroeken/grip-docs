# VitePress Website Manual for Non-Technical Users

This manual will guide you through using Git and GitHub, writing in Markdown, and composing content for the documentation website even if you are not technically proficient.

## Table of Contents

1. [Introduction to Git and GitHub](#1-introduction-to-git-and-github)
2. [Introduction to Markdown](#2-introduction-to-markdown)
3. [Composing Content](#3-composing-content)

## 1. Introduction to Git and GitHub

Git is a version control system that helps track changes made to files and collaborate with others on projects. GitHub is a web-based platform built around Git, which makes it easy to host, share, and collaborate on projects.

### 1.1 Creating a GitHub Account

1. Go to GitHub and click on "Sign Up."
2. Enter your desired username, email address, and password.
3. Click "Create account."
4. Complete the remaining steps to verify your email address and set up your account.

## 2. Introduction to Markdown

Markdown is a lightweight markup language designed to be easy to read and write. It is often used for documentation. Markdown files have the extension .md.

For a more complete explanation of syntax, see this document: [The Markdown elements outlined in the original design document.](https://www.markdownguide.org/basic-syntax)

Here are some basic Markdown syntax elements:

### 2.1 Headers

Use a `#` before the text to create headers. The number of `#` symbols indicates the header level:

```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

#### 2.2 Emphasis

Use asterisks or underscores for emphasis:

```markdown
*italic* or _italic_

**bold** or __bold__

***bold and italic*** or ___bold and italic___
```

*italic* or _italic_

**bold** or __bold__

***bold and italic*** or ___bold and italic___

### 2.3 Lists

Create unordered lists with a `-` or `*`:

```markdown
- Item 1
- Item 2
- Item 3
```

- Item 1
- Item 2
- Item 3

Create ordered lists with numbers followed by a period:

```markdown
1. Item 1
2. Item 2
3. Item 3
```

1. Item 1
2. Item 2
3. Item 3

### 2.4 Links

Create inline links with `[link text](URL)`:

```markdown
[Visit Google](https://www.google.com)
```

[Visit Google](https://www.google.com)

### 2.5 Images

Add images with `![alt text](image-url)`:

```markdown
![Vite Logo](https://vitepress.dev/vite.svg)
```

![Vite Logo](https://vitepress.dev/vite.svg)

### 2.6 Code blocks

Create code blocks by wrapping the code with triple backticks:

<pre>
```javascript
function helloWorld() {
  console.log("Hello, world!");
}
```
</pre>

```javascript
function helloWorld() {
  console.log("Hello, world!");
}
```

### 2.7 Tables

Create tables using | to separate columns and - for headers:

```markdown
| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

## 3 Composing Content

In this section, you'll learn how to compose content for the documentation website using the GitHub web user interface.

### 3.1 Creating a New Markdown File

1. Go to the GitHub repository page and navigate to the appropriate folder (usually within the `docs` folder).
2. Click the "Add file" button near the top-right corner of the page and select "Create new file."
3. Enter the filename with the `.md` extension (e.g., `my-new-page.md`).
4. Start writing your content using Markdown syntax.

### 3.2 Editing an Existing Markdown File

1. Navigate to the file you want to edit in your GitHub repository.
2. Click the pencil icon in the top-right corner of the file view to enter edit mode.
3. Make the desired changes using Markdown syntax.
4. When you're done, scroll down to the "Commit changes" section and enter a brief description of your changes.
5. Click the "Commit changes" button.

### 3.3 Adding Images to Your Content

1. Upload the image to the `/docs/public` folder in your GitHub repository by navigating to the folder and clicking "Add file" > "Upload files." Then, drag and drop the image or click "choose your files" to select the image from your computer.
2. Determine the URL for the image. The URL should start with a slash `/`, followed by the filename and extension (e.g., `/my-image.png`).
3. In your Markdown file, use the following syntax to insert the image:

```
![Image description](URL)
```

Replace "Image description" with a brief description of the image, and "URL" with the URL you determined in step 2.

> Note: Usually, relative urls will also work, however due to the way VitePress processes image assets, we have to require the images be stored within the `/public` folder, and referenced through an absolute uri instead.

### 3.4 Previewing Your Changes

Before committing changes, you can preview your Markdown file to see how it will appear on the VitePress website:

1. In edit mode, click the "Preview changes" tab at the top of the file view.
2. Review your changes and make sure they appear as expected.

### 3.5 Updating the Navigation Sidebar

When you add or edit a page, you may need to update the navigation sidebar to include the new or updated content. Follow these steps to update the sidebar:

1. Locate the VitePress configuration file, in the `.vuepress` folder within the `docs` folder. ([/docs/.vitepress/config.js](/docs/.vitepress/config.js))
2. Open the `config.js` file in edit mode by clicking the pencil icon in the top-right corner of the file view.
3. Find the `sidebar` configuration function. It should look similar to this:

```js
function sidebar() {
  return [
    {
      text: 'Manual',
      collapsed: true,
      items: [
        { text: 'How to', link: '/manual/howto' },
      ]
    },
  ]
```

4. To add a new page to the sidebar, insert the relative path to the Markdown file (without the `.md` extension) within the `items` array of the appropriate section. For example, if you added a new file `my-new-page.md` in the `manual` forlder within the `docs` folder, add '/manual/my-new-page' to the `items` array. The result should look like this (from the snippet above):

```js
return [
  {
    text: 'Manual',
    collapsed: true,
    items: [
      { text: 'How to', link: '/manual/howto' },
      { text: 'My new page', link: '/manual/my-new-page' },
    ]
  },
```

5. To update an existing page, simply edit the existing text or path within the `items` array to match the updated title text or filename or location.

6. If you want to create a new section in the sidebar, add a new object to the `sidebar` array with the following structure:

```js
{
  title: 'New Section Title',
  collapsed: false,
  items: [
    { text: 'New section page 1', link: '/section/page1' },
    { text: 'New section page 2', link: '/section/page2' },
  ]
}
```

Replace `'New Section Title'` with the title of the new section and add the paths to the pages within the `items` array.

7. After making the necessary changes to the `sidebar` configuration, scroll down to the "Commit changes" section, enter a brief description of your changes, and click the "Commit changes" button.

Your updated navigation sidebar will be reflected on the website after a short delay.

### 3.6 Creating a Pull Request for Your Changes

When you're satisfied with your changes, follow these steps to create a pull request:

1. Scroll down to the "Commit changes" section.
2. Enter a brief description of your changes in the "Commit changes" textbox.
3. Select "Create a new branch for this commit and start a pull request" to ensure your changes are made as part of a pull request.
4. Choose a unique name for your new branch that describes the changes you've made.
5. Click the "Propose changes" button.
6. Review your changes on the "Open a pull request" page, and provide additional information if necessary.
7. Click the "Create pull request" button.
8. Your pull request will be submitted for review, and upon approval, your changes will be merged into the main branch and reflected on the website after a short delay.

---

With this guide, you should now be able to use Git and GitHub, write in Markdown, and compose content for a VitePress website even without prior technical experience. As you become more familiar with the tools and syntax, you'll be able to create and edit content more efficiently and confidently.

Note: large parts of this manual were generated by ChatGPT-4, and verified/refined by the author.
