package com.eazy.brush.cache;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

public class ResultView<E, K> implements Serializable {

    private static final ResultView EMPTY = new ResultView(Collections.emptyList(), null);

    public static <T1, T2> ResultView<T1, T2> emptyResultView() {
        return EMPTY;
    }

    public ResultView(List<E> list, K nextCursor) {
        this.list = list;
        this.nextCursor = nextCursor;
    }

    private List<E> list;

    private K nextCursor;

    public List<E> getList() {
        return list;
    }

    public K getNextCursor() {
        return nextCursor;
    }

    public boolean isHasNext() {
        return nextCursor != null;
    }

}
