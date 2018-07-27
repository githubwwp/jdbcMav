package patterntest.proxypattern;

public class RealImage implements Image {

    private String fileName;

    public RealImage(String fileName) {
        this.fileName = fileName;
        loadFromDisk(fileName);
    }

    private void loadFromDisk(String fileName) {
        System.out.println("loading " + fileName);
    }

    @Override
    public void display() {
        System.out.println("display " + fileName);
    }

}
