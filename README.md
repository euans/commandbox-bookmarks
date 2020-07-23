# Bookmarks for CommandBox

Bookmarks allows you to bookmark directories for easy navigation. 

## Installation:

Install bookmarks using commandbox:

```
CommandBox> install commandbox-bookmarks
```

## List bookmarks - list existing bookmarks

```
CommandBox> bookmark list
```

## Add bookmark - add a new bookmark

```

CommandBox> bookmark add '{name}' _['{path}']_
CommandBox> bookmark add 'Home'
```

## Delete bookmark - delete an existing bookmark

```
CommandBox> bookmark delete _['{name}']_ _['{path}']_
```

## Goto bookmark - go to a bookmarked path

```
CommandBox> bookmark goto '{name}'
CommandBox> goto {'name'}
```