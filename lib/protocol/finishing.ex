defmodule Hippy.Protocol.Finishing do
  use Hippy.Protocol.Enum, %{
    none: 3,
    staple: 4,
    punch: 5,
    cover: 6,
    bind: 7,
    saddle_stitch: 8,
    edge_stitch: 9,
    fold: 10,
    trim: 11,
    bale: 12,
    booklet_maker: 13,
    jog_offset: 14,
    coat: 15,
    laminate: 16,
    staple_top_left: 20,
    staple_bottom_left: 21,
    staple_top_right: 22,
    staple_bottom_right: 23,
    edge_stitch_left: 24,
    edge_stitch_top: 25,
    edge_stitch_right: 26,
    edge_stitch_bottom: 27,
    staple_dual_left: 28,
    staple_dual_top: 29,
    staple_dual_right: 30,
    staple_dual_bottom: 31,
    staple_triple_left: 32,
    staple_triple_top: 33,
    staple_triple_right: 34,
    staple_triple_bottom: 35,
    bind_left: 50,
    bind_top: 51,
    bind_right: 52,
    bind_bottom: 53,
    trim_after_pages: 60,
    trim_after_documents: 61,
    trim_after_copies: 62,
    trim_after_job: 63,
    punch_top_left: 70,
    punch_bottom_left: 71,
    punch_top_right: 72,
    punch_bottom_right: 73,
    punch_dual_left: 74,
    punch_dual_top: 75,
    punch_dual_right: 76,
    punch_dual_bottom: 77,
    punch_triple_left: 78,
    punch_triple_top: 79,
    punch_triple_right: 80,
    punch_triple_bottom: 81,
    punch_quad_left: 82,
    punch_quad_top: 83,
    punch_quad_right: 84,
    punch_quad_bottom: 85,
    punch_multiple_left: 86,
    punch_multiple_top: 87,
    punch_multiple_right: 88,
    punch_multiple_bottom: 89,
    fold_accordian: 90,
    fold_double_gate: 91,
    fold_gate: 92,
    fold_half: 93,
    fold_half_z: 94,
    fold_left_gate: 95,
    fold_letter: 96,
    fold_parallel: 97,
    fold_poster: 98,
    fold_right_gate: 99,
    fold_z: 100,
    fold_engineering_z: 101
  }
end