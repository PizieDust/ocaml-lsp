open! Import

[@@@warning "-30"]

module DeleteFileOptions : sig
  type t =
    { recursive : bool
    ; ignoreIfNotExists : bool
    }
end

module DocumentUri : sig
  type t = string
end

module DeleteFile : sig
  type t =
    { kind : unit
    ; uri : DocumentUri.t
    ; options : DeleteFileOptions.t
    }
end

module RenameFileOptions : sig
  type t =
    { overwrite : bool
    ; ignoreIfExists : bool
    }
end

module RenameFile : sig
  type t =
    { kind : unit
    ; oldUri : DocumentUri.t
    ; newUri : DocumentUri.t
    ; options : RenameFileOptions.t
    }
end

module CreateFileOptions : sig
  type t =
    { overwrite : bool
    ; ignoreIfExists : bool
    }
end

module CreateFile : sig
  type t =
    { kind : unit
    ; uri : DocumentUri.t
    ; options : CreateFileOptions.t
    }
end

module Position : sig
  type t =
    { line : int
    ; character : int
    }
end

module Range : sig
  type t =
    { start : Position.t
    ; end_ : Position.t [@key "end"]
    }
end

module TextEdit : sig
  type t =
    { range : Range.t
    ; newText : string
    }
end

module TextDocumentIdentifier : sig
  type t = { uri : DocumentUri.t }
end

module VersionedTextDocumentIdentifier : sig
  type version = unit

  type t = { version : unit }
end

module TextDocumentEdit : sig
  type t =
    { textDocument : VersionedTextDocumentIdentifier.t
    ; edits : TextEdit.t list
    }
end

module WorkspaceEdit : sig
  type documentChanges = unit

  type changes = { uri : unit }

  type t =
    { changes : changes
    ; documentChanges : unit
    }
end

module ApplyWorkspaceEditParams : sig
  type t =
    { label : string
    ; edit : WorkspaceEdit.t
    }
end

module ApplyWorkspaceEditResponse : sig
  type t =
    { applied : bool
    ; failureReason : string
    }
end

module CancelParams : sig
  type id = unit

  type t = { id : unit }
end

module SelectionRangeClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module FoldingRangeClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; rangeLimit : int
    ; lineFoldingOnly : bool
    }
end

module DiagnosticTag : sig
  type t =
    | Unnecessary
    | Deprecated
end

module PublishDiagnosticsClientCapabilities : sig
  type tagSupport = { valueSet : DiagnosticTag.t list }

  type t =
    { relatedInformation : bool
    ; tagSupport : tagSupport
    ; versionSupport : bool
    }
end

module RenameClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; prepareSupport : bool
    }
end

module DocumentOnTypeFormattingClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module DocumentRangeFormattingClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module DocumentFormattingClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module DocumentColorClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module DocumentLinkClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; tooltipSupport : bool
    }
end

module CodeLensClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module CodeActionKind : sig
  type t =
    | Empty
    | QuickFix
    | Refactor
    | RefactorExtract
    | RefactorInline
    | RefactorRewrite
    | Source
    | SourceOrganizeImports
end

module CodeActionClientCapabilities : sig
  type codeActionKind = { valueSet : CodeActionKind.t list }

  type codeActionLiteralSupport = { codeActionKind : codeActionKind }

  type t =
    { dynamicRegistration : bool
    ; codeActionLiteralSupport : codeActionLiteralSupport
    ; isPreferredSupport : bool
    }
end

module SymbolKind : sig
  type t =
    | File
    | Module
    | Namespace
    | Package
    | Class
    | Method
    | Property
    | Field
    | Constructor
    | Enum
    | Interface
    | Function
    | Variable
    | Constant
    | String
    | Number
    | Boolean
    | Array
    | Object
    | Key
    | Null
    | EnumMember
    | Struct
    | Event
    | Operator
    | TypeParameter
end

module DocumentSymbolClientCapabilities : sig
  type symbolKind = { valueSet : SymbolKind.t list }

  type t =
    { dynamicRegistration : bool
    ; symbolKind : symbolKind
    ; hierarchicalDocumentSymbolSupport : bool
    }
end

module DocumentHighlightClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module ReferenceClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module ImplementationClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; linkSupport : bool
    }
end

module TypeDefinitionClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; linkSupport : bool
    }
end

module DefinitionClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; linkSupport : bool
    }
end

module DeclarationClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; linkSupport : bool
    }
end

module MarkupKind : sig
  type t =
    | PlainText
    | Markdown
end

module SignatureHelpClientCapabilities : sig
  type parameterInformation = { labelOffsetSupport : bool }

  type signatureInformation =
    { documentationFormat : MarkupKind.t list
    ; parameterInformation : parameterInformation
    }

  type t =
    { dynamicRegistration : bool
    ; signatureInformation : signatureInformation
    ; contextSupport : bool
    }
end

module HoverClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; contentFormat : MarkupKind.t list
    }
end

module CompletionItemKind : sig
  type t =
    | Text
    | Method
    | Function
    | Constructor
    | Field
    | Variable
    | Class
    | Interface
    | Module
    | Property
    | Unit
    | Value
    | Enum
    | Keyword
    | Snippet
    | Color
    | File
    | Reference
    | Folder
    | EnumMember
    | Constant
    | Struct
    | Event
    | Operator
    | TypeParameter
end

module CompletionItemTag : sig
  type t = Deprecated
end

module CompletionClientCapabilities : sig
  type completionItemKind = { valueSet : CompletionItemKind.t list }

  type tagSupport = { valueSet : CompletionItemTag.t list }

  type completionItem =
    { snippetSupport : bool
    ; commitCharactersSupport : bool
    ; documentationFormat : MarkupKind.t list
    ; deprecatedSupport : bool
    ; preselectSupport : bool
    ; tagSupport : tagSupport
    }

  type t =
    { dynamicRegistration : bool
    ; completionItem : completionItem
    ; completionItemKind : completionItemKind
    ; contextSupport : bool
    }
end

module TextDocumentSyncClientCapabilities : sig
  type t =
    { dynamicRegistration : bool
    ; willSave : bool
    ; willSaveWaitUntil : bool
    ; didSave : bool
    }
end

module TextDocumentClientCapabilities : sig
  type t =
    { synchronization : TextDocumentSyncClientCapabilities.t
    ; completion : CompletionClientCapabilities.t
    ; hover : HoverClientCapabilities.t
    ; signatureHelp : SignatureHelpClientCapabilities.t
    ; declaration : DeclarationClientCapabilities.t
    ; definition : DefinitionClientCapabilities.t
    ; typeDefinition : TypeDefinitionClientCapabilities.t
    ; implementation : ImplementationClientCapabilities.t
    ; references : ReferenceClientCapabilities.t
    ; documentHighlight : DocumentHighlightClientCapabilities.t
    ; documentSymbol : DocumentSymbolClientCapabilities.t
    ; codeAction : CodeActionClientCapabilities.t
    ; codeLens : CodeLensClientCapabilities.t
    ; documentLink : DocumentLinkClientCapabilities.t
    ; colorProvider : DocumentColorClientCapabilities.t
    ; formatting : DocumentFormattingClientCapabilities.t
    ; rangeFormatting : DocumentRangeFormattingClientCapabilities.t
    ; onTypeFormatting : DocumentOnTypeFormattingClientCapabilities.t
    ; rename : RenameClientCapabilities.t
    ; publishDiagnostics : PublishDiagnosticsClientCapabilities.t
    ; foldingRange : FoldingRangeClientCapabilities.t
    ; selectionRange : SelectionRangeClientCapabilities.t
    }
end

module ExecuteCommandClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module WorkspaceSymbolClientCapabilities : sig
  type symbolKind = { valueSet : SymbolKind.t list }

  type t =
    { dynamicRegistration : bool
    ; symbolKind : symbolKind
    }
end

module DidChangeWatchedFilesClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module DidChangeConfigurationClientCapabilities : sig
  type t = { dynamicRegistration : bool }
end

module FailureHandlingKind : sig
  type t =
    | Abort
    | Transactional
    | TextOnlyTransactional
    | Undo
end

module ResourceOperationKind : sig
  type t =
    | Create
    | Rename
    | Delete
end

module WorkspaceEditClientCapabilities : sig
  type t =
    { documentChanges : bool
    ; resourceOperations : ResourceOperationKind.t list
    ; failureHandling : FailureHandlingKind.t
    }
end

module ClientCapabilities : sig
  type window = { workDoneProgress : bool }

  type workspace =
    { applyEdit : bool
    ; workspaceEdit : WorkspaceEditClientCapabilities.t
    ; didChangeConfiguration : DidChangeConfigurationClientCapabilities.t
    ; didChangeWatchedFiles : DidChangeWatchedFilesClientCapabilities.t
    ; symbol : WorkspaceSymbolClientCapabilities.t
    ; executeCommand : ExecuteCommandClientCapabilities.t
    ; workspaceFolders : bool
    ; configuration : bool
    }

  type t =
    { workspace : workspace
    ; textDocument : TextDocumentClientCapabilities.t
    ; window : window
    ; experimental : Json.t
    }
end

module Command : sig
  type t =
    { title : string
    ; command : string
    ; arguments : Json.t list
    }
end

module Location : sig
  type t =
    { uri : DocumentUri.t
    ; range : Range.t
    }
end

module DiagnosticRelatedInformation : sig
  type t =
    { location : Location.t
    ; message : string
    }
end

module DiagnosticSeverity : sig
  type t =
    | Error
    | Warning
    | Information
    | Hint
end

module Diagnostic : sig
  type code = unit

  type t =
    { range : Range.t
    ; severity : DiagnosticSeverity.t
    ; code : unit
    ; source : string
    ; message : string
    ; tags : DiagnosticTag.t list
    ; relatedInformation : DiagnosticRelatedInformation.t list
    }
end

module CodeAction : sig
  type t =
    { title : string
    ; kind : CodeActionKind.t
    ; diagnostics : Diagnostic.t list
    ; isPreferred : bool
    ; edit : WorkspaceEdit.t
    ; command : Command.t
    }
end

module CodeActionContext : sig
  type t =
    { diagnostics : Diagnostic.t list
    ; only : CodeActionKind.t list
    }
end

module WorkDoneProgressOptions : sig
  type t = { workDoneProgress : bool }
end

module CodeActionOptions : sig
  type t = { codeActionKinds : CodeActionKind.t list }
end

module ProgressToken : sig
  type t = unit
end

module PartialResultParams : sig
  type t = { partialResultToken : ProgressToken.t }
end

module WorkDoneProgressParams : sig
  type t = { workDoneToken : ProgressToken.t }
end

module CodeActionParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; range : Range.t
    ; context : CodeActionContext.t
    }
end

module DocumentFilter : sig
  type t =
    { language : string
    ; scheme : string
    ; pattern : string
    }
end

module DocumentSelector : sig
  type t = DocumentFilter.t list
end

module TextDocumentRegistrationOptions : sig
  type documentSelector = unit

  type t = { documentSelector : unit }
end

module CodeActionRegistrationOptions : sig end

module CodeLens : sig
  type t =
    { range : Range.t
    ; command : Command.t
    ; data : Json.t
    }
end

module CodeLensOptions : sig
  type t = { resolveProvider : bool }
end

module CodeLensParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module CodeLensRegistrationOptions : sig end

module Color : sig
  type t =
    { red : int
    ; green : int
    ; blue : int
    ; alpha : int
    }
end

module ColorInformation : sig
  type t =
    { range : Range.t
    ; color : Color.t
    }
end

module ColorPresentation : sig
  type t =
    { label : string
    ; textEdit : TextEdit.t
    ; additionalTextEdits : TextEdit.t list
    }
end

module ColorPresentationParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; color : Color.t
    ; range : Range.t
    }
end

module CompletionTriggerKind : sig
  type t =
    | Invoked
    | TriggerCharacter
    | TriggerForIncompleteCompletions
end

module CompletionContext : sig
  type t =
    { triggerKind : CompletionTriggerKind.t
    ; triggerCharacter : string
    }
end

module InsertTextFormat : sig
  type t =
    | PlainText
    | Snippet
end

module MarkupContent : sig
  type t =
    { kind : MarkupKind.t
    ; value : string
    }
end

module CompletionItem : sig
  type documentation = unit

  type t =
    { label : string
    ; kind : int
    ; tags : CompletionItemTag.t list
    ; detail : string
    ; documentation : unit
    ; deprecated : bool
    ; preselect : bool
    ; sortText : string
    ; filterText : string
    ; insertText : string
    ; insertTextFormat : InsertTextFormat.t
    ; textEdit : TextEdit.t
    ; additionalTextEdits : TextEdit.t list
    ; commitCharacters : string list
    ; command : Command.t
    ; data : Json.t
    }
end

module CompletionList : sig
  type t =
    { isIncomplete : bool
    ; items : CompletionItem.t list
    }
end

module CompletionOptions : sig
  type t =
    { triggerCharacters : string list
    ; allCommitCharacters : string list
    ; resolveProvider : bool
    }
end

module TextDocumentPositionParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; position : Position.t
    }
end

module CompletionParams : sig
  type t = { context : CompletionContext.t }
end

module CompletionRegistrationOptions : sig end

module ConfigurationItem : sig
  type t =
    { scopeUri : DocumentUri.t
    ; section : string
    }
end

module ConfigurationParams : sig
  type t = { items : ConfigurationItem.t list }
end

module DeclarationOptions : sig end

module DeclarationParams : sig end

module StaticRegistrationOptions : sig
  type t = { id : string }
end

module DeclarationRegistrationOptions : sig end

module DefinitionOptions : sig end

module DefinitionParams : sig end

module DefinitionRegistrationOptions : sig end

module DidChangeConfigurationParams : sig
  type t = { settings : Json.t }
end

module TextDocumentContentChangeEvent : sig
  type t = unit
end

module DidChangeTextDocumentParams : sig
  type t =
    { textDocument : VersionedTextDocumentIdentifier.t
    ; contentChanges : TextDocumentContentChangeEvent.t list
    }
end

module FileEvent : sig
  type t =
    { uri : DocumentUri.t
    ; type_ : int [@key "type"]
    }
end

module DidChangeWatchedFilesParams : sig
  type t = { changes : FileEvent.t list }
end

module FileSystemWatcher : sig
  type t =
    { globPattern : string
    ; kind : int
    }
end

module DidChangeWatchedFilesRegistrationOptions : sig
  type t = { watchers : FileSystemWatcher.t list }
end

module WorkspaceFolder : sig
  type t =
    { uri : DocumentUri.t
    ; name : string
    }
end

module WorkspaceFoldersChangeEvent : sig
  type t =
    { added : WorkspaceFolder.t list
    ; removed : WorkspaceFolder.t list
    }
end

module DidChangeWorkspaceFoldersParams : sig
  type t = { event : WorkspaceFoldersChangeEvent.t }
end

module DidCloseTextDocumentParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module TextDocumentItem : sig
  type t =
    { uri : DocumentUri.t
    ; languageId : string
    ; version : int
    ; text : string
    }
end

module DidOpenTextDocumentParams : sig
  type t = { textDocument : TextDocumentItem.t }
end

module DidSaveTextDocumentParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; text : string
    }
end

module DocumentColorOptions : sig end

module DocumentColorParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module DocumentColorRegistrationOptions : sig end

module DocumentFormattingOptions : sig end

module FormattingOptions : sig
  type t =
    { tabSize : int
    ; insertSpaces : bool
    ; trimTrailingWhitespace : bool
    ; insertFinalNewline : bool
    ; trimFinalNewlines : bool
    ; key : unit
    }
end

module DocumentFormattingParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; options : FormattingOptions.t
    }
end

module DocumentFormattingRegistrationOptions : sig end

module DocumentHighlight : sig
  type t =
    { range : Range.t
    ; kind : int
    }
end

module DocumentHighlightKind : sig
  type t =
    | Text
    | Read
    | Write
end

module DocumentHighlightOptions : sig end

module DocumentHighlightParams : sig end

module DocumentHighlightRegistrationOptions : sig end

module DocumentLink : sig
  type t =
    { range : Range.t
    ; target : DocumentUri.t
    ; tooltip : string
    ; data : Json.t
    }
end

module DocumentLinkOptions : sig
  type t = { resolveProvider : bool }
end

module DocumentLinkParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module DocumentLinkRegistrationOptions : sig end

module DocumentOnTypeFormattingOptions : sig
  type t =
    { firstTriggerCharacter : string
    ; moreTriggerCharacter : string list
    }
end

module DocumentOnTypeFormattingParams : sig
  type t =
    { ch : string
    ; options : FormattingOptions.t
    }
end

module DocumentOnTypeFormattingRegistrationOptions : sig end

module DocumentRangeFormattingOptions : sig end

module DocumentRangeFormattingParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; range : Range.t
    ; options : FormattingOptions.t
    }
end

module DocumentRangeFormattingRegistrationOptions : sig end

module DocumentSymbol : sig
  type t =
    { name : string
    ; detail : string
    ; kind : SymbolKind.t
    ; deprecated : bool
    ; range : Range.t
    ; selectionRange : Range.t
    ; children : t list
    }
end

module DocumentSymbolOptions : sig end

module DocumentSymbolParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module DocumentSymbolRegistrationOptions : sig end

module ErrorCodes : sig
  type t =
    | ParseError
    | InvalidRequest
    | MethodNotFound
    | InvalidParams
    | InternalError
    | ServerErrorStart
    | ServerErrorEnd
    | ServerNotInitialized
    | UnknownErrorCode
    | RequestCancelled
    | ContentModified
end

module ExecuteCommandOptions : sig
  type t = { commands : string list }
end

module ExecuteCommandParams : sig
  type t =
    { command : string
    ; arguments : Json.t list
    }
end

module ExecuteCommandRegistrationOptions : sig end

module FileChangeType : sig
  type t =
    | Created
    | Changed
    | Deleted
end

module FoldingRange : sig
  type t =
    { startLine : int
    ; startCharacter : int
    ; endLine : int
    ; endCharacter : int
    ; kind : string
    }
end

module FoldingRangeKind : sig
  type t =
    | Comment
    | Imports
    | Region
end

module FoldingRangeOptions : sig end

module FoldingRangeParams : sig
  type t = { textDocument : TextDocumentIdentifier.t }
end

module FoldingRangeRegistrationOptions : sig end

module MarkedString : sig
  type t = unit
end

module Hover : sig
  type contents = unit

  type t =
    { contents : unit
    ; range : Range.t
    }
end

module HoverOptions : sig end

module HoverParams : sig end

module HoverRegistrationOptions : sig end

module ImplementationOptions : sig end

module ImplementationParams : sig end

module ImplementationRegistrationOptions : sig end

module InitializeError : sig
  type t = UnknownProtocolVersion
end

module InitializeParams : sig
  type workspaceFolders = unit

  type trace = unit

  type rootUri = unit

  type rootPath = unit

  type clientInfo =
    { name : string
    ; version : string
    }

  type processId = unit

  type t =
    { processId : unit
    ; clientInfo : clientInfo
    ; rootPath : unit
    ; rootUri : unit
    ; initializationOptions : Json.t
    ; capabilities : ClientCapabilities.t
    ; trace : unit
    ; workspaceFolders : unit
    }
end

module WorkspaceFoldersServerCapabilities : sig
  type changeNotifications = unit

  type t =
    { supported : bool
    ; changeNotifications : unit
    }
end

module SelectionRangeOptions : sig end

module SelectionRangeRegistrationOptions : sig end

module RenameOptions : sig
  type t = { prepareProvider : bool }
end

module ReferenceOptions : sig end

module TypeDefinitionOptions : sig end

module TypeDefinitionRegistrationOptions : sig end

module SignatureHelpOptions : sig
  type t =
    { triggerCharacters : string list
    ; retriggerCharacters : string list
    }
end

module SaveOptions : sig
  type t = { includeText : bool }
end

module TextDocumentSyncOptions : sig
  type t =
    { openClose : bool
    ; change : int
    ; willSave : bool
    ; willSaveWaitUntil : bool
    ; save : SaveOptions.t
    }
end

module ServerCapabilities : sig
  type workspace = { workspaceFolders : WorkspaceFoldersServerCapabilities.t }

  type selectionRangeProvider = unit

  type foldingRangeProvider = unit

  type renameProvider = unit

  type documentRangeFormattingProvider = unit

  type documentFormattingProvider = unit

  type colorProvider = unit

  type codeActionProvider = unit

  type documentSymbolProvider = unit

  type documentHighlightProvider = unit

  type referencesProvider = unit

  type implementationProvider = unit

  type typeDefinitionProvider = unit

  type definitionProvider = unit

  type declarationProvider = unit

  type hoverProvider = unit

  type textDocumentSync = unit

  type t =
    { textDocumentSync : unit
    ; completionProvider : CompletionOptions.t
    ; hoverProvider : unit
    ; signatureHelpProvider : SignatureHelpOptions.t
    ; declarationProvider : unit
    ; definitionProvider : unit
    ; typeDefinitionProvider : unit
    ; implementationProvider : unit
    ; referencesProvider : unit
    ; documentHighlightProvider : unit
    ; documentSymbolProvider : unit
    ; codeActionProvider : unit
    ; codeLensProvider : CodeLensOptions.t
    ; documentLinkProvider : DocumentLinkOptions.t
    ; colorProvider : unit
    ; documentFormattingProvider : unit
    ; documentRangeFormattingProvider : unit
    ; documentOnTypeFormattingProvider : DocumentOnTypeFormattingOptions.t
    ; renameProvider : unit
    ; foldingRangeProvider : unit
    ; executeCommandProvider : ExecuteCommandOptions.t
    ; selectionRangeProvider : unit
    ; workspaceSymbolProvider : bool
    ; workspace : workspace
    ; experimental : Json.t
    }
end

module InitializeResult : sig
  type serverInfo =
    { name : string
    ; version : string
    }

  type t =
    { capabilities : ServerCapabilities.t
    ; serverInfo : serverInfo
    }
end

module InitializedParams : sig end

module LocationLink : sig
  type t =
    { originSelectionRange : Range.t
    ; targetUri : DocumentUri.t
    ; targetRange : Range.t
    ; targetSelectionRange : Range.t
    }
end

module LogMessageParams : sig
  type t =
    { type_ : int [@key "type"]
    ; message : string
    }
end

module Message : sig
  type t = { jsonrpc : string }
end

module MessageActionItem : sig
  type t = { title : string }
end

module MessageType : sig
  type t =
    | Error
    | Warning
    | Info
    | Log
end

module NotificationMessage : sig
  type params = unit

  type t =
    { method_ : string [@key "method"]
    ; params : unit
    }
end

module ParameterInformation : sig
  type documentation = unit

  type label = unit

  type t =
    { label : unit
    ; documentation : unit
    }
end

module PrepareRenameParams : sig end

module ProgressParams : sig
  type t =
    { token : ProgressToken.t
    ; value : Json.t
    }
end

module PublishDiagnosticsParams : sig
  type t =
    { uri : DocumentUri.t
    ; version : int
    ; diagnostics : Diagnostic.t list
    }
end

module ReferenceContext : sig
  type t = { includeDeclaration : bool }
end

module ReferenceParams : sig
  type t = { context : ReferenceContext.t }
end

module ReferenceRegistrationOptions : sig end

module Registration : sig
  type t =
    { id : string
    ; method_ : string [@key "method"]
    ; registerOptions : Json.t
    }
end

module RegistrationParams : sig
  type t = { registrations : Registration.t list }
end

module RenameParams : sig
  type t = { newName : string }
end

module RenameRegistrationOptions : sig end

module RequestMessage : sig
  type params = unit

  type id = unit

  type t =
    { id : unit
    ; method_ : string [@key "method"]
    ; params : unit
    }
end

module ResponseError : sig
  type data = unit

  type t =
    { code : int
    ; message : string
    ; data : Json.t
    }
end

module ResponseMessage : sig
  type result = unit

  type id = unit

  type t =
    { id : unit
    ; result : unit
    ; error : ResponseError.t
    }
end

module SelectionRange : sig
  type t =
    { range : Range.t
    ; parent : t
    }
end

module SelectionRangeParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; positions : Position.t list
    }
end

module ShowMessageParams : sig
  type t =
    { type_ : int [@key "type"]
    ; message : string
    }
end

module ShowMessageRequestParams : sig
  type t =
    { type_ : int [@key "type"]
    ; message : string
    ; actions : MessageActionItem.t list
    }
end

module SignatureInformation : sig
  type documentation = unit

  type t =
    { label : string
    ; documentation : unit
    ; parameters : ParameterInformation.t list
    }
end

module SignatureHelp : sig
  type t =
    { signatures : SignatureInformation.t list
    ; activeSignature : int
    ; activeParameter : int
    }
end

module SignatureHelpTriggerKind : sig
  type t =
    | Invoked
    | TriggerCharacter
    | ContentChange
end

module SignatureHelpContext : sig
  type t =
    { triggerKind : SignatureHelpTriggerKind.t
    ; triggerCharacter : string
    ; isRetrigger : bool
    ; activeSignatureHelp : SignatureHelp.t
    }
end

module SignatureHelpParams : sig
  type t = { context : SignatureHelpContext.t }
end

module SignatureHelpRegistrationOptions : sig end

module SymbolInformation : sig
  type t =
    { name : string
    ; kind : SymbolKind.t
    ; deprecated : bool
    ; location : Location.t
    ; containerName : string
    }
end

module TextDocumentSyncKind : sig
  type t =
    | None
    | Full
    | Incremental
end

module TextDocumentChangeRegistrationOptions : sig
  type t = { syncKind : TextDocumentSyncKind.t }
end

module TextDocumentSaveReason : sig
  type t =
    | Manual
    | AfterDelay
    | FocusOut
end

module TextDocumentSaveRegistrationOptions : sig
  type t = { includeText : bool }
end

module TypeDefinitionParams : sig end

module Unregistration : sig
  type t =
    { id : string
    ; method_ : string [@key "method"]
    }
end

module UnregistrationParams : sig
  type t = { unregisterations : Unregistration.t list }
end

module WatchKind : sig
  type t =
    | Create
    | Change
    | Delete
end

module WillSaveTextDocumentParams : sig
  type t =
    { textDocument : TextDocumentIdentifier.t
    ; reason : int
    }
end

module WorkDoneProgressBegin : sig
  type t =
    { kind : unit
    ; title : string
    ; cancellable : bool
    ; message : string
    ; percentage : int
    }
end

module WorkDoneProgressCancelParams : sig
  type t = { token : ProgressToken.t }
end

module WorkDoneProgressCreateParams : sig
  type t = { token : ProgressToken.t }
end

module WorkDoneProgressEnd : sig
  type t =
    { kind : unit
    ; message : string
    }
end

module WorkDoneProgressReport : sig
  type t =
    { kind : unit
    ; cancellable : bool
    ; message : string
    ; percentage : int
    }
end

module WorkspaceSymbolOptions : sig end

module WorkspaceSymbolParams : sig
  type t = { query : string }
end

module WorkspaceSymbolRegistrationOptions : sig end
