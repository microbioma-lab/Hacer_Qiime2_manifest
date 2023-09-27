# Este script de bash es para generar el archivo MANIFEST de secuencias paired-end demultiplexadas que tienen el formato EMP:
├── Sa.F.D.28_10_L001_R1_001.fastq.gz
├── Sa.F.D.28_10_L001_R2_001.fastq.gz
├── Sa.F.D.30_8_L001_R1_001.fastq.gz
├── Sa.F.D.30_8_L001_R2_001.fastq.gz
├── Sa.F.D.33_18_L001_R1_001.fastq.gz
├── Sa.F.D.33_18_L001_R2_001.fastq.gz
├── Sa.F.D.34_20_L001_R1_001.fastq.gz
├── Sa.F.D.34_20_L001_R2_001.fastq.gz
├── Sa.F.D.35_3_L001_R1_001.fastq.gz
├── Sa.F.D.35_3_L001_R2_001.fastq.gz

#Paso 1. Crear un directorio llamado raw_seqs y poner ahí los archivos de las secuencias

 ── raw_seqs
│   ├── MANIFEST.csv
│   ├── MANIFEST_ejemplo.csv
│   ├── Sa.F.D.28_10_L001_R1_001.fastq.gz
│   ├── Sa.F.D.28_10_L001_R2_001.fastq.gz
│   ├── Sa.F.D.30_8_L001_R1_001.fastq.gz
│   ├── Sa.F.D.30_8_L001_R2_001.fastq.gz
│   ├── Sa.F.D.33_18_L001_R1_001.fastq.gz
│   ├── Sa.F.D.33_18_L001_R2_001.fastq.gz
│   ├── Sa.F.D.34_20_L001_R1_001.fastq.gz
│   ├── Sa.F.D.34_20_L001_R2_001.fastq.gz
│   ├── Sa.F.D.35_3_L001_R1_001.fastq.gz
│   ├── Sa.F.D.35_3_L001_R2_001.fastq.gz

#Paso 2. Descargar el archivo hacermanifestR1_R2.sh y cambiar el permiso de ejecución.
chmode +x hacermanifestR1_R2.sh

#Paso 3. Ejecutar el script de bash:
./hacermanifestR1_R2.sh

#¡Listo! Cuando aparece el mensaje "MANIFEST creado: MANIFEST.csv" se ha generado tu archivo MANIFEST.

#Usa el siguiente script de qiime2 para importar tus secuencias:
qiime tools import \
--type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path raw_seqs/MANIFEST.csv \
--output-path demux.qza \
--input-format 'PairedEndFastqManifestPhred33'