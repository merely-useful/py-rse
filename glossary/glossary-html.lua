--
-- Transform `\gref{TERM}{KEY}` in R Markdown files into `<a href="glossary.html#KEY">TERM</a>`.
--
function RawInline(el)
  if (el.c[1] == "tex") and (string.find(el.c[2], "\\gref{")) then
    -- io.stderr:write("FOUND ", el.t, " + ", el.c[1], " + ", el.c[2], "\n")
    el = transform(el)
    -- io.stderr:write("...BECOMES ", el.t, " + ", el.c[1], " + ", el.c[2], "\n")
  end
  return el
end

function RawBlock(el)
  if (el.c[1] == "latex") and (string.find(el.c[2], "\\gref{")) then
    -- io.stderr:write("FOUND ", el.t, " + ", el.c[1], " + ", el.c[2], "\n")
    el = transform(el)
  end
  return el
end

function transform(el)
  el.c[1] = "html"
  for term, id in string.gmatch(el.c[2], "\\gref{(.+)}{(.+)}") do
    el.c[2] = "<a href=\"glossary.html#" .. id .. "\">" .. term .. "</a>"
  end
  return el
end
