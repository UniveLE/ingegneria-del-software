# Ingegneria del Software
Repository dedicata al corso di Ignegneria del Software [CT0090] e al progetto ad esso assoicato.

## Links utili
- [Google Drive](https://drive.google.com/drive/u/1/folders/1Uj_QCArNBLdxEDssbc_CuOa-ywtnEj8N)
- Deliverables progetto:
  - [Definizione dei gruppi](https://docs.google.com/document/d/1PkdKdY0VVbg5wnJmTqyKyIJd0CjheFJ0VdZq4MZRh6s/edit?usp=sharing) (26/09/2023)
  - [D0 - Proposta iniziale](https://docs.google.com/document/d/1xngqidRZJ17-ISJTAwZ7FoSYlMm0qoQqacum-v72Sa8/edit?usp=sharing) (03/10/2023)
  - [D1 - Piano di Progetto](https://docs.google.com/document/d/1dMfetNAEwDuCpsTE4CXUk1HMZkqXpaCxojGtm54Ku_0/edit?usp=sharing) (17/10/2023)
  - D2 - Documento dei Requisiti (31/10/2023)
  - D3 - Piano di Testing (14/11/2023)
  - D4 - Documento di Progettazione (28/11/2023)
  - D5 - Versione 1.0 del codice sorgente (15/12/2023)
  - D6 - Versione 1.1. del codice e allineamento documentazione (15/01/2024)

## Documentazione generale
In questa sezione viene analizzata la struttura del Team e del progetto. Per maggiori dettagli consultare la documentazione sopra indicata.

- **Nome del progetto**: MyFoodTracker
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