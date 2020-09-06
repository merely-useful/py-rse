--
-- Transform `\gref{TERM}{KEY}` in R Markdown files into `<a href="glossary.html#KEY">TERM</a>`.
--
function RawInline(el)
  if (el.t == "RawInline") and (el.c[1] == "tex") and (string.find(el.c[2], "\\gref{")) then
    -- io.stderr:write("FOUND RawInline tex ", el.c[1], " + ", el.c[2], "\n")
    el.c[1] = "html"
    temp = {}
    for term, id in string.gmatch(el.c[2], "\\gref{(.+)}{(.+)}") do
      el.c[2] = "<a href=\"glossary.html#" .. id .. "\">" .. term .. "</a>"
    end
    -- io.stderr:write("...BECOMES ", el.c[1], " + ", el.c[2], "\n")
  end
  return el
end
