class FunnyScriptAstConstructor {
  
  public static FunnyLangRootNode parse(CharStream inputStream, FunnyLangTruffleLanguage lang) {
        var lexer = new FunnyLangLexer(inputStream);
        var parser = new FunnyLangParser(new CommonTokenStream(lexer));
        parser.setErrorHandler(new BailErrorStrategy());

        var scriptContext = parser.script();
        var constructor = new FunnyLangTruffleAstConstructor();
        var exprNode =  constructor.visitScript(scriptContext);
        return new FunnyLangRootNode(exprNode, lang);
    }
}
