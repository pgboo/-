package com.paotui.util;

import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;

@Data
public class PageBean<T> {
    private int pageNum;
    private int pageSize;
    private long total;
    private int pages;
    private List<T> list;
    private boolean isFirstPage;
    private boolean isLastPage;
    private boolean hasPreviousPage;
    private boolean hasNextPage;

    public PageBean(List<T> list) {
        PageInfo<T> pageInfo = new PageInfo<>(list);
        this.pageNum = pageInfo.getPageNum();
        this.pageSize = pageInfo.getPageSize();
        this.total = pageInfo.getTotal();
        this.pages = pageInfo.getPages();
        this.list = pageInfo.getList();
        this.isFirstPage = pageInfo.isIsFirstPage();
        this.isLastPage = pageInfo.isIsLastPage();
        this.hasPreviousPage = pageInfo.isHasPreviousPage();
        this.hasNextPage = pageInfo.isHasNextPage();
    }
}
