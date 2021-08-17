using UnicodePlots, ReferenceTests, Test
using ReferenceTests: BeforeAfterFull
using StatsBase
using SparseArrays
using StableRNGs
using Random: seed!
using Dates: Date, Day

tests = [
    "tst_common.jl",
    "tst_graphics.jl",
    "tst_canvas.jl",
    "tst_plot.jl",
    "tst_barplot.jl",
    "tst_histogram.jl",
    "tst_scatterplot.jl",
    "tst_lineplot.jl",
    "tst_spy.jl",
    "tst_boxplot.jl",
    "tst_heatmap.jl"
]

const RNG = StableRNG(1337)

function test_ref(reference, actual)
    @test_reference(reference, actual, render = BeforeAfterFull(), format = "TXT")
end

for test in tests
    @testset "$test" begin
        include(test)
    end
end
