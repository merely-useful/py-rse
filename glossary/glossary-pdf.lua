--
-- Transform `\gref{TERM}{KEY_WITH_UNDERSCORES}` in R Markdown files into `\gref{TERM}{KEY\_WITH\_UNDERSCORES}`.
--
function RawInline(el)
  if (el.t == "RawInline") and (el.c[1] == "tex") and (string.find(el.c[2], "\\gref{")) then
    -- io.stderr:write("FOUND RawInline tex ", el.c[1], " + ", el.c[2], "\n")
    el.c[2] = string.gsub(el.c[2], "_", "\\_")
    -- io.stderr:write("...BECOMES ", el.c[1], " + ", el.c[2], "\n")
  end
  return el
end
