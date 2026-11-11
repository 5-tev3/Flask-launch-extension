// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require('vscode');
const path = require('path');

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed

/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {

    // Use the console to output diagnostic information (console.log) and errors (console.error)
    // This line of code will only be executed once when your extension is activated
    console.log('Congratulations, your extension "flask-launcher" is now active!');

    // The command has been defined in the package.json file
    // Now provide the implementation of the command with  registerCommand
    // The commandId parameter must match the command field in package.json
    const disposableRun = vscode.commands.registerCommand('flask-launcher.runProject', () => {
        const editor = vscode.window.activeTextEditor;
        if (!editor) {
            vscode.window.showInformationMessage('První otevřete editor s Flask projektem, který chcete spustit.');
            return;
        }
        const cesta = editor.document.uri.fsPath;
        const cesta_ke_scriptu = context.asAbsolutePath(path.join('scripts', 'run.bat'));
        let terminal = vscode.window.activeTerminal;
            terminal = vscode.window.createTerminal({
                name: "Flask launcher",
                shellPath: "cmd.exe"
            });
        terminal.show();
        terminal.sendText(`"${cesta_ke_scriptu}" "${cesta}"`);
    });

    const tlacitko = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, 100);
    tlacitko.command = "flask-launcher.runProject";
    tlacitko.text = "$(play) Spusti Flask";
    tlacitko.tooltip = "Spusti vas Flask projekt";
    tlacitko.show(); 

    context.subscriptions.push(tlacitko);
}

// This method is called when your extension is deactivated
function deactivate() {}

module.exports = {
    activate,
    deactivate
};