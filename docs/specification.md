# Synchronous FIFO Specification

## 1. Overview

This project implements a parameterized synchronous FIFO
using SystemVerilog.

## 2. Parameters

|Parameter    |Description      |Default|
-----------------------------------------
|DATA_WIDTH   |FIFO data width  |   8   |
|DEPTH        |FIFO depth       |   16  |
|     |      |

## 3. interface

| Signal       | Direction | Description  |
-------------------------------------------
| clk          | input     | Clock        |
| rst_n        | input     | Reset        |
| wr_en        | input     | Write enable |
| wr_data      | input     | Write data   |
| rd_en        | input     | Read enable  |
| rd_data      | output    | Read data    |
| full         | output    | FIFO full    |
| empty        | output    | FIFO empty   |
| almost_full  | output    | Almost full  |
| almost_empty | output    | Almost empty |

## 4. FIFO Behavior

### Write

A write occurs when:

wr_en = 1 && full = 0

### Read

A read occurs when:

rd_en = 1 && empty = 0

## 5. Protection

Write operations are blocked when FIFO is full.

Read operations are blocked when FIFO is empty.

## 6. Simultaneous Read/Write

Read and write operations may occur in the same clock cycle.

## 7. Reset

Reset initializes:

-read pointer
-write pointer
-FIFO count
-status flags