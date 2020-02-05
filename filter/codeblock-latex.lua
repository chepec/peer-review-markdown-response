-- Filter codeblocks with this function if the target format is LaTeX
if FORMAT:match 'latex' then
    function CodeBlock (block)
      -- Replace all codeblocks with our manuscript environment
      -- https://tex.stackexchange.com/a/511575/10824
      -- my very naive solution to have whatever the user places in the codeblock
      -- "language" definition to show up in the tcolorbox title
      if block.classes[1] == nil then
        return pandoc.RawBlock(
          'tex', 
          '\\begin{manuscriptnopage}\n' .. block.text .. '\n\\end{manuscriptnopage}'
        )
      else
        return pandoc.RawBlock(
          'tex',
          '\\begin{manuscript}{' .. block.classes[1] .. '}\n' .. block.text .. '\n\\end{manuscript}'
        )
      end
    end
end

-- This way, we can keep the markdown source FREE FROM LATEX COMMANDS
-- which will aid in readability and ease of use for collaborators

-- https://ulyngs.github.io/blog/posts/2019-02-19-how-to-use-pandoc-filters-for-advanced-customisation-of-your-r-markdown-document/
