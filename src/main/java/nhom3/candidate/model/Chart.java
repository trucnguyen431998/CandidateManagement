package nhom3.candidate.model;

import java.util.List;

public class Chart {

    private List<String> labels;
    private Datasets datasets;

    public List<String> getLabels() {
        return labels;
    }

    public void setLabels(List<String> labels) {
        this.labels = labels;
    }

    public Datasets getDatasets() {
        return datasets;
    }

    public void setDatasets(Datasets datasets) {
        this.datasets = datasets;
    }
}
