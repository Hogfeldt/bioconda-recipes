#!/bin/bash
set -eu -o pipefail

declare -a PROGRAMS=(
    'BamTagHistogram'
    'BamTagOfTagCounts'
    'BaseDistributionAtReadPosition'
    'CollapseBarcodesInPlace'
    'CollapseTagWithContext'
    'CompareDropSeqAlignments'
    'ConvertToRefFlat'
    'CreateIntervalsFiles'
    'DetectBeadSubstitutionErrors'
    'DetectBeadSynthesisErrors'
    'DigitalExpression'
    'FilterBam'
    'FilterBamByTag'
    'FilterGtf'
    'GatherGeneGCLength'
    'GatherMolecularBarcodeDistributionByGene'
    'GatherReadQualityMetrics'
    'MaskReferenceSequence'
    'MergeDgeSparse'
    'PolyATrimmer'
    'ReduceGtf'
    'SelectCellsByNumTranscripts'
    'SingleCellRnaSeqMetricsCollector'
    'TagBamWithReadSequenceExtended'
    'TagReadWithGeneExonFunction'
    'TagReadWithGeneFunction'
    'TagReadWithInterval'
    'TrimStartingSequence'
    'ValidateReference'
)

outdir=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM
mkdir -p $outdir
bindir=$PREFIX/bin
mkdir -p $bindir
cp -r ./* $outdir/

for PROG in "${PROGRAMS[@]}"
do
	sed -i'.bak' -E 's@^thisdir=.+@thisdir='$outdir'@g' "${outdir}/${PROG}"
	rm -f "${outdir}/${PROG}.bak"
	ln -s "${outdir}/${PROG}" "${bindir}/${PROG}"
	chmod 0755 "${bindir}/${PROG}"
done

