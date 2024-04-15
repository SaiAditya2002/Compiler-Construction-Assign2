#include<stdio.h>
#include<stdlib.h>

typedef struct Node
{
    int nodetype;
    struct Node* parent;
    struct Node* child; //use vector? ie array
    bool valid; //make int?

    //instead of union
    int ival;
    double dval;
    char* sval;
    char dummy;

    //array use
    int start;
    int end;
    int arraySize;
    struct Node* ref;
} Node;

struct Node* newNode(int x)
{
    struct Node* node = new Node;
    node->nodetype = type;
    node->valid = 0;
    node->parent = NULL;

    return node;


}

void deleteNode(struct Node* node)
{
    if(node)
}