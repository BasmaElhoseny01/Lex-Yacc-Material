// File includes declarations for both the AST and the symbol table data structures.

// Symbol Table Delectations
extern int sym[26]; /* Declaration of sym */ //  This is Delectation --> it informs the compiler that the entity exists but does not allocate memory for it.

// AST Delectations
// Enum for Node Type
typedef enum
{
    typeCon,
    typeId,
    typeOpr
} nodeEnum;

// Constant Node
typedef struct
{
    /* data */
    int value; /* value of constant */
} conNodeType;

// Identifier Node
typedef struct
{
    /* data */
    int i; /* subscript to sym array */
} idNodeType;

// Internal Node with an operator
typedef struct
{
    /* data */
    int oper;                  /* operator */
    int nops;                  /* number of operands */
    struct nodeTypeTag *op[1]; /* Operands */
} oprNodeType;

// Generic Node in the syntax tree
typedef struct nodeTypeTag
{
    /* data */
    nodeEnum type; /* type of node */

    union
    {
        conNodeType con; /* constants */
        idNodeType id;   /* identifiers */
        oprNodeType opr; /* operators */
    };

} nodeType;
