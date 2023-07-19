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
Le Malabi est un test gratuit, mais nous vous demandons de contacter notre laboratoire pour l'obtenir. Pourquoi ? Parce que contrairement à d'autres tests de dépistage de la dyslexie qui ne mesurent que le nombre de mots correctement lus et le temps de lecture, le Malabi exige une attention particulière à la notation d'erreurs spécifiques. Pour ce faire, il faut connaître et se former aux différentes dyslexies observées dans la littérature scientifique. Nous vous recommandons, avant de nous contacter pour essayer le test, de regarder cette vidéo sur les différents types de dyslexie (en anglais, avec sous-titres en français) : https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie

*Get the screener*
*The Malabi is a free test, but we ask you to contact our laboratory to obtain it. Why? Because, unlike other dyslexia screening tests which only measure the number of words correctly read and reading time, the Malabi requires special attention to the scoring of specific errors. This requires knowledge and training in the various dyslexias observed in scientific literature. Before contacting us to try out the test, we recommend that you watch this video on the different types of dyslexia: https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie*

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
Une fois le test effectué, en utilisant la feuille de scoring dans le dossier 'data/cotation_malabi'. Écoute les enregistrements des mots/pseudomots marqués comme incorrects. Écris la réponse en utilisant la trascription phonétique indiquée dans la feuille de calcul 'phonetic_coding_malabi'. Par exemple, le mot "chat" est codé "Sa" parce que le "ch" forme un seul phonème et que le "t" n'est pas prononcé.

Une fois que tu as écrit manuellement la transcription phonétique des réponses, exécute le script (1R_error_response_coding.R) pour associer le type d'erreur à la réponse incorrecte. Par exemple, si pour le psedoword 'pocile', la transcription phonétique de l'erreur est 'polis', notre script codera cela comme une erreur de position de lettre, parce que les lettres 'c' et 'l' ont été transposées.

Il arrive parfois qu'une erreur ait plus d'un code. Dans ce cas, il y a une logique à suivre pour choisir le code. Lorsque plus de deux erreurs évidentes ont été commises, l'erreur est codée 0, ce qui signifie qu'elle est trop complexe pour une logique évidente. A partir des réponses codées, nous avons calculé les erreurs normales pour les French grades 6eme et 5eme. 

Tous les différents types de codes d'erreur avec des explications et des exemples se trouvent dans la feuille de calcul "cotation_malabi_french_error_codes.xlsx".

# Dépistage des dyslexies
Une fois que les réponses des sujets ont été codées, le script (scripts/1R_malabi_dyslexia_detection.R) calcule le nombre d'erreurs d'un certain type et vérifie si le score des lecteurs atteint le seuil par rapport aux lecteurs normaux pour une dyslexie particulière.

After the subjects responses have been coded, the script (scripts/2R_malabi_dyslexia_detection.R)  to calculate the number of errors of a certain type and see if the readers score reaches threshold compared to normal readers for a particular dyslexia.

##
*Instructions for scoring the Malabi*

*Download the scoring sheet (malabi_cotation.pdf).*
*Don't forget to turn on Audacity! Time each test. If you forget, you can take the time on Audacity. On the scoring sheet, note the identifying information. In order to pay close attention to the child's answers, don't note the type of error while the child is reading, simply cross out the words read incorrectly, then note them later as you listen to the recording.
Test 1) Single words 
I'm going to show you some unrelated words. Try to read them quickly and accurately. (Look at your watch) Get ready... Go!
Test 2) Pseudowords
Now I'm going to show you some words I've made up that don't exist. Read them quickly and accurately. Get ready.... Go!
Test 3) Word pairs 
Now I'm going to show you some real words, but this time they come in pairs. Tell me afterwards if you find this easier or harder. Read them quickly and accurately. Get ready... Go!
Stop AUDACITY and save the audio file: first_name_initial of family_name_school ... all lowercase please.*

*Error type coding the Malabi.*

*Once the test is done, using the spreadsheet in the folder data 'cotation_malabi_'. Listen to the recordings of the words/pseudowords marked as incorrect. Write down the response using the phonetic trascription indicated in the spreadsheet 'phonetic_coding_malabi. For example the word 'chat' is coded 'Sa'because the 'ch' makes a single phoneme and the 't' is not pronounced.*

*Once you have manually written the phonetic transcription of the responses, run the script (XX) to associate the error type to the incorrect response. For example, if for the psedoword 'pocile', the phonetic transcription of the error is 'polis', our script will code this as a letter position error, because the letters 'c' and 'l' were transposed.*

*Sometimes an error may have more than one code. In these instances, there is a logic to follow in choosing which code. When more than 2 obvious errors have been made, the error as coded as 0, meaning it is too complex for an obvious logic.From the coded responses we calculated the norm errors for grades 6 and 7. *

*All of the different types of error codes with explanations and examples are in the spreadsheet 'cotation_malabi_french_error_codes.xlsx'.*

*Testing for dyslexia*
*After the subjects responses have been coded, the script (scripts/2R_malabi_dyslexia_detection.R) to calculate the number of errors of a certain type and see if the readers score reaches threshold compared to normal readers for a particular dyslexia.*

