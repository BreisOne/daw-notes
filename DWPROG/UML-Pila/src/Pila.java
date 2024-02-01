import  java.lang.Object;
import java.util.Arrays;

public class Pila implements CollectionInterface{
    private int numElements;
    Object[] elements;
    public Pila(int numElements, Object[] elements){
        this.numElements = numElements;
        this.elements =  new Object[numElements];
        for (int i = 0; i < this.elements.length; i++) {
            this.elements[i] = elements[i];
        }
    }

    @Override
    public boolean isEmpty() {
        return numElements == 0;
    }

    @Override
    public Object get() {
        Object fisrtElement = elements[0];

        for (int i = 1; i < numElements; i++) {
            elements[i-1] = elements[i];
        }

        numElements--;

        return fisrtElement;
    }

    @Override
    public Object first() {
        return elements[0];
    }

    public Object add(Object element) {
        int numElementsTemp = numElements;
        numElements++;

        Object[] elementsTemp = new Object[numElements];


        for (int i = 0; i < numElementsTemp; i++) {
            elementsTemp[i] = elements[i];
        }

        elementsTemp[numElementsTemp] = element;

        elements = elementsTemp;

        return elements;
    }

    public  String toString(){
        return Arrays.toString(elements);
    }
}
