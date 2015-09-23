/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
  config.extraPlugins = 'lineutils';
  config.extraPlugins = 'widget';
  config.extraPlugins = 'codesnippet'
  config.extraPlugins = 'wpmore';

  // Remove all formatting when pasting text copied from websites or Microsoft Word
  config.forcePasteAsPlainText = true;
  config.pasteFromWordRemoveFontStyles = true;
  config.pasteFromWordRemoveStyles = true;

  config.codeSnippet_theme = 'railscasts';
};
