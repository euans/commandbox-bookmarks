# Bookmarks for CommandBox

Bookmarks allow you to bookmark directories for easy navigation.

## Installation:

Install bookmarks using commandbox:

```bash
CommandBox> install commandbox-bookmarks
```

## Bookmark List - *list existing bookmarks*

```bash
CommandBox> bookmark list
```

## Bookmark Add (+) - *add a new bookmark*
**Name** *(optional)* - Defaults to current folder name.  
**Path** *(optional)* - Fully qualified or relative file path *(eg: C:\projects or ../../)*. Defaults to current file path.  
```bash
CommandBox> bookmark add [name] [path]
CommandBox> bookmark add Home c:\projects
CommandBox> bookmark add
CommandBox> bookmark + 'My Bookmark'
```

## Bookmark Delete (-) - *delete an existing bookmark*
**Name** *(optional)* - Defaults to current folder name.  
**Path** *(optional)* - Fully qualified or relative file path *(eg: C:\projects or ../../)*. Defaults to current file path.  
```bash
CommandBox> bookmark delete [name] [path]
CommandBox> bookmark delete Home
CommandBox> bookmark delete
CommandBox> bookmark - 'My Bookmark'
```

## Bookmark Goto / Goto - *go to a bookmarked path*
**Name** - Name of bookmark.  
```bash
CommandBox> bookmark goto name
CommandBox> goto <name>
CommandBox> goto Home
```

## Bookmark Clear - *delete all saved bookmarks*

```bash
CommandBox> bookmark clear
```

## Bookmarks as a Variable - *ability to refer to a bookmark as a variable*
**Name** - Name of bookmark.
```bash
CommandBox> echo ${bookmark.<name>}
CommandBox> echo ${bookmark.Home}
```
