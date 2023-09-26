# Ingegneria del Software
Repository dedicata al corso di Ignegneria del Software [CT0090] e al progetto ad esso assoicato.

## Links utili
- [Google Drive](https://drive.google.com/drive/u/1/folders/1Uj_QCArNBLdxEDssbc_CuOa-ywtnEj8N)
- [Documentazione progetto](https://docs.google.com/document/d/1PkdKdY0VVbg5wnJmTqyKyIJd0CjheFJ0VdZq4MZRh6s/edit?usp=sharing)

## Documentazione generale
In questa sezione viene analizzata la struttura del Team e del progetto. Per maggiori dettagli consultare la documentazione sopra indicata.

- **Nome del progetto**: 
- **Componenti del Team**:
  - Alessandro Campagnaro - 863419@stud.unive.it
  - Elia Corò - 892507@stud.unive.it
  - Lorenzo Vaccher - 891921@stud.unive.it
  - Davide Vecchiato - 890998@stud.unive.it

### Gestione GitHub
Per assicurare una conformità e sicurezza del codice sono stati utilizzati i seguenti servizi:
- [Husky](https://www.npmjs.com/package/husky) per uniformare i commit e le pull request tra i membri del team
- [GitGuardian](https://www.gitguardian.com/) per verificare che nel codice committato non ci siano password o chiavi segrete
- [GitHub Actions](https://github.com/features/actions) per creare una build in automatico del progetto ad ogni release e verificare la correttezza del codice scritto

### Esecuzione del progetto
Come prima cosa è necessario installare le dipendenze NPM con il seguente comando:
```sh
npm install && npm run prepare
```
Tale comando deve essere eseguito in fase di development e testing, solo la prima volta che si inizializza la repository in locale.