# metaborg-antlr

An SDF3 grammar describing ANTLRv4 grammars.
This project was created to compare an SDF3 grammar to a pre-existing ANTLR grammar for the same language.
By generating random sentences from the ANTLR grammar and parsing them using the SDF3-generated parser, we detect where the SDF3 grammar is too restrictive. 
Vice versa, by generating random sentences from the SDF3 grammar and parsing them using the ANTLR-generated parser, we detect where the SDF3 grammar is too liberal.
Together, these two should expose all differences between the ANTLR and SDF3 grammar.

## Resources

- [Parser Rules](https://github.com/antlr/antlr4/blob/963d44f930e6c74085bcb063923a6354661e9b6f/doc/parser-rules.md)
- [Lexer Rules](https://github.com/antlr/antlr4/blob/963d44f930e6c74085bcb063923a6354661e9b6f/doc/lexer-rules.md)

