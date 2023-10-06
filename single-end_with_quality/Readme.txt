# Este script de bash es para generar el archivo MANIFEST de secuencias single-end demultiplexadas que tienen el formato EMP:

├── L1S105_9_L001_R1_001.fastq.gz
├── L1S140_6_L001_R1_001.fastq.gz
├── L1S208_10_L001_R1_001.fastq.gz
├── L1S257_11_L001_R1_001.fastq.gz
├── L1S281_5_L001_R1_001.fastq.gz
├── L1S57_13_L001_R1_001.fastq.gz
├── L1S76_12_L001_R1_001.fastq.gz
├── L1S8_8_L001_R1_001.fastq.gz
├── L2S155_25_L001_R1_001.fastq.gz
├── L2S175_27_L001_R1_001.fastq.gz
├── L2S204_1_L001_R1_001.fastq.gz
├── L2S222_23_L001_R1_001.fastq.gz
├── L2S240_7_L001_R1_001.fastq.gz
├── L2S309_33_L001_R1_001.fastq.gz
├── L2S357_15_L001_R1_001.fastq.gz

#Paso 1. Crear un directorio llamado raw_seqs y poner ahí los archivos de las secuencias

└── raw_seqs
    ├── L1S105_9_L001_R1_001.fastq.gz
    ├── L1S140_6_L001_R1_001.fastq.gz
    ├── L1S208_10_L001_R1_001.fastq.gz
    ├── L1S257_11_L001_R1_001.fastq.gz
    ├── L1S281_5_L001_R1_001.fastq.gz
    ├── L1S57_13_L001_R1_001.fastq.gz
    ├── L1S76_12_L001_R1_001.fastq.gz
    ├── L1S8_8_L001_R1_001.fastq.gz

#Paso 2. Descargar el archivo hacermanifest.sh y cambiar el permiso de ejecución.
chmode +x hacermanifest.sh

#Paso 3. Ejecutar el script de bash:
./hacermanifest.sh

#¡Listo! El archivo MANIFEST se ha creado en el directorio actual: /single-end_with_quality/raw_seqs/MANIFEST

#Usa el siguiente script de qiime2 para importar tus secuencias:
qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-format 'SingleLanePerSampleSingleEndFastqDirFmt'\
  --input-path raw_seqs \
  --output-path demux-single.qza