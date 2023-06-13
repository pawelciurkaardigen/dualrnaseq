"""
rna_class_content.py

It should go to three subworkflows:
- salmon_alignment_based.nf
- salmon_selective_alignment.nf
- star_htseq.nf (not required yet)

Parameters:
- --quantification_table:
    - in salmon_alignment_based.nf: SALMON_SPLIT_TABLE_COMBINED.out.{params.organism}
    - in salmon_selective_alignment.nf SALMON_SPLIT_TABLE_COMBINED.out.{params.organism}
    - in star_htseq.nf (subworkflow is in progress)
- --gene_attribute (taken directly from one of pipeline's parameters)
- --gene_annotations (output from PROCESS that calls: extract_annotations_from_gff.py)
- --quantifier (used for file names)
- --rna_classes (additional excel file that is passed to the pipeline)
"""

process RNA_CLASS_CONTENT() {
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'nfcore/dualrnaseq:dev' :
        'nfcore/dualrnaseq:dev' }"
    input:
    output:
    script:
    """
    python $workflow.projectDir/bin/rna_class_content.py \
        --quantification_table \
        --gene_attribute \
        --gene_annotations \
        --quantifier \
        --rna_classes
    """
}
