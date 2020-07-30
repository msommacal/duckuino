%{
    #include <stdio.h>
    
    int yylex();
    int yyerror();

    void header();
    void footer();
%}

%token alt altgr backspace default_delay delay menu pause_key capslock ctrl delete down end enter esc function gui home insert left letter new_line numlock pagedown pageup printscreen rem repeat right scrolllock separator shift space string tab up

// required to get text
%union {
    char *text;
    int integer;
}

%%
file: {header();} lines {footer();}

lines: line new_line {printf("\n");} lines
     | line
     |

line: keys {printf("Keyboard.releaseAll();");}
    | time
    | rem {printf("// %s", yylval.text);}
    | string {printf("Keyboard.print(\"%s\");", yylval.text);}
    | new_line {printf("\n");}

time: default_delay {printf("default_delay\n");}
    | delay {printf("delay(%d);", yylval.integer*10);}

keys: key separator keys
    | key

key: alt {printf("Keyboard.press(KEY_LEFT_ALT);\n");}
   | altgr {printf("Keyboard.press(KEY_RIGHT_ALT);\n");}
   | backspace {printf("Keyboard.press(KEY_BACKSPACE);\n");}
   | menu {printf("Keyboard.press(0x76+0x88);\n");}
   | pause_key {printf("Keyboard.press(0x48+0x88);\n");}
   | capslock {printf("Keyboard.press(KEY_CAPS_LOCK);\n");}
   | ctrl {printf("Keyboard.press(KEY_LEFT_CTRL);\n");}
   | delete {printf("Keyboard.press(KEY_DELETE);\n");}
   | down {printf("Keyboard.press(KEY_DOWN_ARROW);\n");}
   | end {printf("Keyboard.press(KEY_END);\n");}
   | enter {printf("Keyboard.press(KEY_RETURN);\n");}
   | esc {printf("Keyboard.press(KEY_ESC);\n");}
   | function {printf("Keyboard.press(KEY_F%d);\n", yylval.integer);}
   | gui {printf("Keyboard.press(KEY_LEFT_GUI);\n");}
   | home {printf("Keyboard.press(KEY_HOME);\n");}
   | insert {printf("Keyboard.press(KEY_INSERT);\n");}
   | left {printf("Keyboard.press(KEY_LEFT_ARROW);\n");}
   | numlock {printf("Keyboard.press(0x53+0x88);\n");}
   | pagedown {printf("Keyboard.press(KEY_PAGE_DOWN);\n");}
   | pageup {printf("Keyboard.press(KEY_PAGE_UP);\n");}
   | printscreen {printf("Keyboard.press(0x46+0x88);\n");}
   | right {printf("Keyboard.press(KEY_RIGHT_ARROW);\n");}
   | scrolllock {printf("Keyboard.press(0x47+0x88);\n");}
   | shift {printf("Keyboard.press(KEY_LEFT_SHIFT);\n");}
   | space {printf("Keyboard.press(' ');\n");}
   | tab {printf("Keyboard.press(KEY_TAB);\n");}
   | up {printf("Keyboard.press(KEY_UP_ARROW);\n");}
   | letter {printf("Keyboard.press('%s');\n", yylval.text);}
%%

int yyerror(char *s) {
    printf("yyerror : %s\n",s);
    return 0;
}

void header() {
    printf("#include <Keyboard.h>\n\n");
    printf("void setup() {\n");
}

void footer() {
    printf("}\n\n");
    printf("void loop() {}\n");
}

int main(void) {
    yyparse();
    return 0;
}