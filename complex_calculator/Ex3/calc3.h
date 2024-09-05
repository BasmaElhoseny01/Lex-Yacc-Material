typedef enum {
    typeCon,
    typeId,
    typeOpr
} nodeEnum;


// A node in the syntax tree may hold
/*1. A constant (conNodeType): constants */
typedef struct {
    int value;                  /* value of constant */
} conNodeType;

/*2. An identifier (idNodeType): identifiers */
typedef struct {
    int i;                      /* subscript to sym array */
} idNodeType;

/*3. An internal node with an operator (oprNodeType): operators */
typedef struct {
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    struct nodeTypeTag *op[1];	/* operands, extended at runtime */
} oprNodeType;


// nodeType Structure: This structure represents a generic node in the syntax tree

typedef struct nodeTypeTag {
    //  It contains a field type of type nodeEnum, which indicates the type of node it is (whether it's a constant, identifier, or operator)
    nodeEnum type;              /* type of node */


    // The union containing conNodeType, idNodeType, and oprNodeType is defined anonymously within the nodeType structure.
    // This means that you refer to it using the name of the outer structure (nodeType) followed by the dot operator and the member name (con, id, or opr),
    // like this: nodeType.con, nodeType.id, or nodeType.opr.
    // Anonymous structures or unions are often used when you need a simple grouping of related fields within another structure or union, 
    //and you don't anticipate needing to refer to them by name outside of that context. It helps to keep the code concise and focused on the overall structure.

    union {
        conNodeType con;        /* constants */
        idNodeType id;          /* identifiers */
        oprNodeType opr;        /* operators */
    };
} nodeType;


// Declaration for Symbol Table
extern int sym[26];
