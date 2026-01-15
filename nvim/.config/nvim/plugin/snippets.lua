local ls = require( "luasnip" )
local extras = require( "luasnip.extras" )
local fmt = require( "luasnip.extras.fmt" )
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = extras.rep

vim.keymap.set( { "i", "s" }, "<A-n>", function()
                   if ls.expand_or_jumpable() then
                      ls.expand_or_jump()
                   end
                end, { silent = true, desc = "go to next snippet jump" } )

vim.keymap.set( { "i", "s" }, "<A-p>", function()
                   if ls.jumpable( -1 ) then
                      ls.jump( -1 )
                   end
                end, { silent = true, desc = "go to previous snippet jump" } )


-- --[[ GIT ]]--

local function git_snippet( type )
   local node = {
      s( "git_" .. type, {
         t( type .. "(" ),
         i( 1 ),
         t( "): " ),
         i( 2 ),
         t( { "", "" } ),
         t( { "", "" } ),
      } ),
   }
   return node
end

local function get_git_snippets()
   local types = {
      "feat",
      "fix",
      "docs",
      "style",
      "refactor",
      "test",
      "chore",
   }

   local nodes = {}

   for _, v in pairs( types ) do
      vim.list_extend(
         nodes,
         git_snippet( v )
      )
   end

   return nodes
end

ls.add_snippets( "gitcommit", get_git_snippets() )


-- --[[ HTML ]]--

ls.add_snippets( "html", {
   s( "tag", {
      t( "<" ),
      i( 1 ),
      t( ">" ),
      t( { "", "\t" } ),
      i( 0 ),
      t( { "", "</" } ),
      rep( 1 ),
      t( ">" ),
   } ),
} )


local function docs_snip( args )
   local insert = 1
   local nodes = {
      t( "/**" ),
      t( { "", " * " } ),
      i( 1, "A short description" ),
      t( { "", " *" } ),
   }
   insert = insert + 1

   for indx, arg in ipairs( vim.split( args[2][1], ", " ) ) do
      vim.list_extend(
         nodes,
         { t( { "", " * @param " .. arg } ) }
      )
      vim.list_extend(
         nodes,
         { t( ", " ), i( insert, "desc" ) }
      )
      insert = insert + 1
   end

   -- return
   if args[1][1] ~= "void" then
      vim.list_extend(
         nodes,
         { t( { "", " *" } ), t( { "", " * @return " .. args[1][1] .. ", " } ), i( insert ) }
      )
      insert = insert + 1
   end

   -- add the end block
   vim.list_extend(
      nodes,
      { t( { "", " */" } ) }
   )

   return sn( nil, nodes )
end

-- --[[ C ]]--

ls.add_snippets( "c", {
   s( "fn", {
      d( 4, docs_snip, { 1, 3 } ),
      t( { "", "" } ),
      i( 1, "type" ),
      t( " " ),
      i( 2, "name" ),
      t( "(" ),
      i( 3 ),
      t( ")" ),
      t( { " {", "\t" } ),
      i( 0 ),
      t( { "", "}" } ),
   } ),
} )
