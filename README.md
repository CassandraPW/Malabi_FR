# Malabi_FR
Informations et instructions en français pour le Malabi. 
*English Translation information and instructions for the Malabi are in italic.*

Malabi: un dépisteur de dyslexie pour le français, visant divers déficits de lecture. Contient des scripts, données, et instructions.
*Malabi: a dyslexia screener for French, targeting various reading deficits. Contains scripts, data, and instructions.*

# La recherche Malabi
This project first began with norming the data of French 6th and 7th grade students from 2 different schools.
- All of their responses were coded phonologically by hand, by two people. 
- Incorrect responses were coded for the type of error made given prior identification of dyselxia types.
- A database was created of all of these errors 'stimuli/coded_response_errors_3.csv'.
- The script 'scripts/error_response_coding.R' uses this database to automatically code new response files and warn when there are new errors.

# Obtenir le test
Le Malabi est un test gratuit. Contrairement à d'autres tests de dépistage de la dyslexie qui ne mesurent que le nombre de mots correctement lus et le temps de lecture, le Malabi exige une attention particulière à la notation d'erreurs spécifiques. Pour ce faire, il faut connaître et se former aux différentes dyslexies observées dans la littérature scientifique. Nous vous recommandons, avant de nous contacter pour essayer le test, de regarder cette vidéo sur les différents types de dyslexie (en anglais, avec sous-titres en français) : https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie

*Get the screener*
*The Malabi is a free test. Unlike other dyslexia screening tests which only measure the number of words correctly read and reading time, the Malabi requires special attention to the scoring of specific errors. This requires knowledge and training in the various dyslexias observed in scientific literature. Before contacting us to try out the test, we recommend that you watch this video on the different types of dyslexia: https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie*

### contact : cassandra.potier-watkins@college-de-france.fr

# ----------------------------------
# Instructions pour la passation du Malabi
Téléchargez la feuille de cotation (malabi_cotation.pdf)
N’oublier pas d’allumer Audacity ! Chronométrer chaque test. Si vous oubliez, vous pouvez prendre le temps sur Audacity. Sur la feuille de cotation, noter les informations identifiantes. Afin d'être très attentif aux réponses de l'enfant, ne note pas le type d'erreur pendant que l'enfant lit, barre simplement les mots lus de façon incorrecte, puis note-les plus tard en écoutant l'enregistrement.
## Test 1) Mots isolés 
Je vais te montrer des mots, ils n’ont pas de lien entre eux. Essaie de les lire rapidement et avec précision. (Regardez votre montre) Prépare-toi… vas-y !
## Test 2) Pseudomots
Maintenant je vais te montrer des mots qui n’existent pas, que j’ai inventés. Lis-les rapidement et avec précision. Prépare-toi…. Vas-y !
## Test 3) Paires de mots 
Maintenant je vais te montrer des vrais mots, mais cette fois ils vont par deux. Tu me diras après si tu trouves cela plus facile ou plus difficile. Lis-les rapidement et avec précision. Prépare-toi… vas-y !

Arrêter AUDACITY et sauvegarder le fichier audio : prénom_initial du nom de la famille_école … tout en minuscule svp.

# Error type coding
Une fois le test effectué, en utilisant la feuille de scoring dans le dossier 'data/malabi_subjectname.xlsx'. Écoute les enregistrements des mots/pseudomots marqués comme incorrects sur votre feuille de cotations. Écris la réponse du subjet en utilisant la trascription phonétique indiquée dans la feuille de calcul 'phonetic_coding_malabi.xlsx'. Par exemple, le mot "chat" est codé "Sa" parce que le "ch" forme un seul phonème et que le "t" n'est pas prononcé.

Une fois que tu as écrit manuellement la transcription phonétique des réponses, exécute le code (script/1R_error_response_coding.R) pour associer le type d'erreur à la réponse incorrecte. Par exemple, si pour le psedoword 'pocile', la transcription phonétique de l'erreur est 'polis', notre script codera cela comme une erreur de position de lettre, parce que les lettres 'c' et 'l' ont été transposées.

Il arrive parfois qu'une erreur ait plus d'un code. Dans ce cas, il y a une logique à suivre pour choisir le code. Lorsque plus de deux erreurs évidentes ont été commises, l'erreur est codée 0, ce qui signifie qu'elle est trop complexe pour une logique évidente. A partir des réponses codées, nous avons calculé les erreurs normales pour les Français niveaux 6eme et 5eme. 

Tous les différents types de codes d'erreur avec des explications et des exemples se trouvent dans le tableur "codingScheme_malabi_french.pdf".

# Dépistage des dyslexies
Une fois que les réponses des sujets ont été codées, le code (2R_malabi_dyslexia_detection.R) calcule le nombre d'erreurs d'un certain type et vérifie si le score des lecteurs atteint le seuil par rapport aux lecteurs normaux pour une dyslexie particulière (Français niveaux 6eme et 5eme).



*# ----------------------------------*
*# Instructions for Conducting the Malabi Test*
*Download the scoring sheet (malabi_cotation.pdf)*
*Don't forget to turn on Audacity! Time each test. If you forget, you can take the time on Audacity. On the scoring sheet, note the identifying information. In order to pay close attention to the child's responses, don't note the type of error while the child is reading, just cross out the words read incorrectly, then note them later while listening to the recording.*
*## Test 1) Isolated Words*
*I'm going to show you some words, they don't have any connection between them. Try to read them quickly and accurately. (Look at your watch) Get ready...go!*
*## Test 2) Pseudowords*
*Now I'm going to show you words that don't exist, that I've made up. Read them quickly and accurately. Get ready...go!*
*## Test 3) Pairs of Words*
*Now I'm going to show you real words, but this time they come in pairs. You'll tell me afterwards if you find this easier or more difficult. Read them quickly and accurately. Get ready...go!*

*Stop AUDACITY and save the audio file: first name_initial of the family name_school...all in lowercase please.*

*# Error Type Coding*
*Once the test is performed, using the scoring sheet in the folder 'data/malabi_subjectname.xlsx'. Listen to the recordings of the words/pseudowords marked as incorrect on your scoring sheet. Write the subject's response using the phonetic transcription indicated in the 'phonetic_coding_malabi.xlsx' spreadsheet. For example, the French word "chat" is coded "Sa" because the "ch" forms a single phoneme and the "t" is not pronounced.*

*Once you have manually written the phonetic transcription of the responses, run the code (script/1R_error_response_coding.R) to associate the error type with the incorrect response. For example, if for the pseudoword 'pocile', the phonetic transcription of the error is 'polis', our script will code this as a letter position error, because the letters 'c' and 'l' have been transposed.*

*Sometimes you may come across a reaponse an error has more than one code. In this case, there is a logic to follow to choose the code. When more than two obvious errors have been committed, the error is coded 0, which means it is too complex for obvious logic. From the coded responses, we have calculated the normal errors for French 6th and 5th grade levels. Also, you may eventually come across an error not in our database, the code will alert you to us and you will need to this.*

*All the different types of error codes with explanations and examples can be found in the spreadsheet "codingScheme_malabi_french.pdf".*

*# Dyslexia Screening*
*Once the subjects' responses have been coded, the code (2R_malabi_dyslexia_detection.R) calculates the number of errors of a certain type and checks if the reader's score reaches the threshold compared to normal readers for a particular dyslexia (French 6th and 5th grade levels).*
