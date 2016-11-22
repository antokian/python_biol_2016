# Skript spustite pomoci prikazu bash human_bash.sh
# GTF soubor stahnete tady: http://ftp.ensembl.org/pub/release-86/gtf/homo_sapiens/Homo_sapiens.GRCh38.86.gtf.gz
# Kolik je chromozomu?
echo 'Kolik je chromozomu?'
cat Homo_sapiens.GRCh38.86.gtf | cut -f1 | sort | uniq | grep -P '^[0-9XYM]' | wc -l
# Kolik je genu?
echo 'Kolik je genu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\tgene\t' | cut -f9 | cut -d';' -f1 | sort | uniq | wc -l
# Kolik je protein-kodujicich genu?
echo 'Kolik je protein-kodujicich genu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\tgene\t' | grep -F 'gene_biotype "protein_coding"' |  cut -f9 | cut -d';' -f1 | sort | uniq | wc -l 
# Kolik je transkriptu?
echo 'Kolik je transkriptu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\ttranscript\t' | cut -f9 | cut -d';' -f3 | sort | uniq | wc -l
# Kolik protein-kodujicich transkriptu?
echo 'Kolik protein-kodujicich transkriptu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\ttranscript\t' | grep -F 'gene_biotype "protein_coding"' | cut -f9 | cut -d';' -f3 | sort | uniq | wc -l
# Ktere protein kodujici geny mají nejvíce transkriptů?
echo 'Ktere protein kodujici geny mají nejvíce transkriptů?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\ttranscript\t' | cut -f9 | cut -d';' -f1 | sort | uniq -c | sort -rn | head
# Které transkripty mají nejvíce exonu?
echo 'Které transkripty mají nejvíce exonu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\texon\t' | grep -F 'gene_biotype "protein_coding"' | cut -f9 | cut -d';' -f3 | sort | uniq -c | sort -rn | head
# Které transkripty mají nejmene exonu?
echo 'Které transkripty mají nejmene exonu?'
cat Homo_sapiens.GRCh38.86.gtf | grep -P '\texon\t' | grep -F 'gene_biotype "protein_coding"' | cut -f9 | cut -d';' -f3 | sort | uniq -c | sort -rn | tail
