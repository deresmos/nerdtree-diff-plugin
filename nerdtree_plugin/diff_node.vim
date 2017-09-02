if exists('g:loaded_nerdtree_diff_node')
  finish
endif
let g:loaded_nerdtree_diff_node = 1

call NERDTreeAddMenuItem({
      \'text'     : '(v)imdiff with current node',
      \'shortcut' : 'v',
      \'callback' : 'NERDTreeDiffNode'})

function! NERDTreeDiffNode()
  let l:currentNode = g:NERDTreeFileNode.GetSelected()

  if l:currentNode.path.isDirectory
    echo "Can't diff with directory"
    echohl ErrorMsg | echo 'NERDTreeDiffNode aborted!' | echohl None
    return
  endif

  " Diff with current node
  wincmd p
  tab split
  execute 'vertical diffsplit' l:currentNode.path.str()

endfunction
