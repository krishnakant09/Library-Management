# Experiment 5: XML, DTD & XSLT Transformation

## Aim
To design an XML document modeling a Library Book Catalog, validate its structure using a Document Type Definition (DTD), and transform the XML data into a styled HTML table using Extensible Stylesheet Language Transformations (XSLT).

---

## File Structure

```
d:\KK-Project\WT Experiments\5th\
├── library.dtd       # Document Type Definition (Grammar & Rules)
├── library.xml       # Structured XML Data (5 Books)
├── library.xsl       # XSLT 1.0 Template (Transforms XML -> HTML Table)
├── style.css         # Modern, lightweight styling for table & badges
├── index.html        # Clean browser runner with tabs & live search
└── README.md         # Experiment notes, execution steps & viva answers
```

---

## 1. Document Type Definition (`library.dtd`)

The DTD defines the allowed elements, sequences, and attributes:
```dtd
<!ELEMENT library (book+)>
<!ELEMENT book (title, author, publisher, year, isbn, price)>
<!ATTLIST book
          id ID #REQUIRED
          category (ComputerScience | AI | WebDev | CyberSecurity) "ComputerScience"
          status (Available | Borrowed) "Available">
<!ELEMENT title (#PCDATA)>
<!ELEMENT author (#PCDATA)>
<!ELEMENT publisher (#PCDATA)>
<!ELEMENT year (#PCDATA)>
<!ELEMENT isbn (#PCDATA)>
<!ELEMENT price (#PCDATA)>
<!ATTLIST price currency CDATA "USD">
```

### Key DTD Rules:
- `library (book+)`: Root element contains 1 or more book elements (`+` means one or more).
- `book (title, author, publisher, year, isbn, price)`: Elements must appear in this exact sequence.
- `id ID #REQUIRED`: Each book must have a unique alphanumeric identifier.
- `category (...)`: Enumerated attribute restricted to 4 specific values.
- `#PCDATA`: Parsed Character Data (regular text).

---

## 2. Structured XML Data (`library.xml`)

Links to both the DTD and XSLT stylesheet via prologs:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="library.xsl"?>
<!DOCTYPE library SYSTEM "library.dtd">
<library>
  <book id="B101" category="ComputerScience" status="Available">
    <title>Clean Code</title>
    <author>Robert C. Martin</author>
    <publisher>Prentice Hall</publisher>
    <year>2008</year>
    <isbn>978-0132350884</isbn>
    <price currency="USD">37.50</price>
  </book>
  <!-- More books ... -->
</library>
```

---

## 3. XSLT Transformation (`library.xsl`)

Demonstrates essential XSLT 1.0 tags:
- `<xsl:template match="/">`: Matches root element.
- `count(library/book)`: XPath function calculating total number of books.
- `<xsl:for-each select="library/book">`: Iterates over each book node.
- `<xsl:sort select="title" order="ascending"/>`: Sorts books alphabetically by title.
- `<xsl:value-of select="..."/>`: Extracts element text or attribute (`@id`, `@category`).
- `<xsl:choose>` / `<xsl:when>`: Conditional formatting for status badge (Available = Green, Borrowed = Red).

---

## How to Run

### Method 1: Direct in Browser (Simplest)
- Double-click **`index.html`** in any web browser (Chrome, Edge, Firefox).
- Switch tabs to inspect the rendered table, XML, DTD, and XSL files.

### Method 2: Native Browser Transformation (Firefox)
- Open **`library.xml`** directly in Mozilla Firefox.
- Firefox will automatically read `library.xsl` and display the styled HTML table.

### Method 3: Local Server (Optional)
```powershell
# Using Python
python -m http.server 8000
# Then open: http://localhost:8000/library.xml
```

---

## Viva Questions & Short Answers

1. **What is XML?**
   - Extensible Markup Language; a markup language designed to store and transport structured data independently of hardware and software.

2. **Difference between Well-Formed and Valid XML:**
   - **Well-Formed:** Follows basic XML syntax (single root, closed tags, case sensitive).
   - **Valid:** Is well-formed AND adheres to an associated DTD or XSD schema.

3. **What is the difference between `#PCDATA` and `CDATA`?**
   - `#PCDATA` (Parsed Character Data) is parsed by the XML parser; entities inside are expanded.
   - `CDATA` (Character Data) is raw text that is NOT parsed by the XML parser.

4. **What does XSLT stand for and what is its role?**
   - Extensible Stylesheet Language Transformations. It transforms XML documents into HTML, XHTML, or other formats.

5. **Name 4 common XSLT elements:**
   - `<xsl:template>`, `<xsl:for-each>`, `<xsl:value-of>`, and `<xsl:sort>`.
