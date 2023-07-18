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
Le Malabi est un test gratuit, mais nous vous demandons de contacter notre laboratoire pour l'obtenir. Pourquoi ? Parce que le Malabi, contrairement à d'autres tests de dépistage de la dyslexie, exige une attention particulière à la notation d'erreurs spécifiques ainsi qu'à la mesure du nombre global d'erreurs et de la vitesse de lecture. Nous vous recommandons, avant de nous contacter pour essayer le test, de regarder cette vidéo sur les différents types de dyslexie (en anglais, avec sous-titres en français) : https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie
contact : cassandra.potier-watkins@college-de-france.fr

*Get the screener*
*The Malabi is a free test, however, we require that you contact our lab to obtain it. Why, becasue the Malabi, unlike other dyslexia screeners requires careful attention to specific error scoring along with measuring the overall number of errors and reading speed. We reccomend that before you contact us to try the test, please watch this video on different dyslexia types (in English, with French subtitles) : https://www.college-de-france.fr/fr/agenda/seminaire/les-troubles-specifiques-du-developpement-cognitif/diagnostic-et-remediation-des-differents-sous-types-de-dyslexie
contact : cassandra.potier-watkins@college-de-france.fr*

# Instructions pour la passation du Malabi
Téléchargez la feuille de notation (feuille_de_notation_malabi.pdf)
N’oublier pas d’allumer Audacity ! Chronométrer chaque test. Si vous oubliez, vous pouvez prendre le temps sur Audacity. Sur la feuille de cotation, noter les informations identifiantes. Afin d'être très attentif aux réponses de l'enfant, ne note pas le type d'erreur pendant que l'enfant lit, barre simplement les mots lus de façon incorrecte, puis note-les plus tard en écoutant l'enregistrement.
## Test 1) Mots isolés 
Je vais te montrer des mots, ils n’ont pas de lien entre eux. Essaie de les lire rapidement et avec précision. (Regardez votre montre) Prépare-toi… vas-y !
## Test 2) Pseudomots
Maintenant je vais te montrer des mots qui n’existent pas, que j’ai inventés. Lis-les rapidement et avec précision. Prépare-toi…. Vas-y !
## Test 3) Paires de mots 
Maintenant je vais te montrer des vrais mots, mais cette fois ils vont par deux. Tu me diras après si tu trouves cela plus facile ou plus difficile. Lis-les rapidement et avec précision. Prépare-toi… vas-y !

Arrêter AUDACITY et sauvegarder le fichier audio : prénom_initial du nom de la famille_école … tout en minuscule svp.


*Instructions for scoring the Malabi

Download the scoring sheet (feuille_de_notation_malabi.pdf).
Don't forget to turn on Audacity! Time each test. If you forget, you can take the time on Audacity. On the scoring sheet, note the identifying information. In order to pay close attention to the child's answers, don't note the type of error while the child is reading, simply cross out the words read incorrectly, then note them later as you listen to the recording.
Test 1) Single words 
I'm going to show you some unrelated words. Try to read them quickly and accurately. (Look at your watch) Get ready... Go!
Test 2) Pseudowords
Now I'm going to show you some words I've made up that don't exist. Read them quickly and accurately. Get ready.... Go!
Test 3) Word pairs 
Now I'm going to show you some real words, but this time they come in pairs. Tell me afterwards if you find this easier or harder. Read them quickly and accurately. Get ready... Go!
Stop AUDACITY and save the audio file: first_name_initial of family_name_school ... all lowercase please.*

# Codage de l'erreur de Malabi.
Il arrive souvent qu'une erreur ait plus d'un code. Dans ce cas, il y a une logique à suivre pour choisir le code. Lorsque plus de deux erreurs évidentes ont été commises, l'erreur est codée 0, ce qui signifie qu'elle est trop complexe pour une logique évidente.
- A partir des réponses codées, nous avons calculé les erreurs normales pour les grades 6 et 7. Voir 'scripts/grade_norming.R'

## Analyse orthographique visuelle
1) Pour toutes les erreurs visuelles identifiables, si elles peuvent être attribuées à une transposition ou à une migration de lettres, elles doivent être codées comme telles.
2) Les erreurs de négligence à droite ou à gauche sont identifiées comme n'étant pas attribuées à une transposition ou à une migration de lettres, elles doivent former des mots.

## Erreurs sous-lexicales
1) Dyslexie vocalique, mise en évidence par un nombre significativement plus élevé d'erreurs de voyelles que de consonnes. Elle semble être due à un mauvais tamponnage des voyelles par rapport aux consonnes dans le tampon de sortie phonologique. C'est pourquoi elle se manifeste principalement dans la lecture de non-mots et dans la lecture de mots lorsque la voie lexicale est altérée.
2) Phonologie multi-lettres, également mesurée dans la lecture sous-lexicale. Elle se manifeste par une difficulté à lire les digrammes, les trigrammes et les correspondances graphème-phonème basées sur des règles. C'est le contraire de la lecture de mots, où la régularisation des correspondances graphème-phonème est liée à un déficit de la lecture lexicale, connu sous le nom de dyslexie de surface.

## Erreurs lexicales
1) La dyslexie de surface se manifeste par une difficulté d'accès au lexique, ce qui signifie que les enfants régularisent trop les mots irréguliers ou comportant des digrammes ou des trigrammes, des correspondances graphème-phonème basées sur des règles et des règles de double lettre.

## Tampon de sortie phonologique
Le tampon de sortie phonologique présente des difficultés à lire à haute voix des pseudo-mots longs ou des mots à la morphologie complexe, ainsi que des difficultés à les répéter oralement. Composante de la mémoire de travail qui assemble la représentation phonologique d'un mot et la stocke jusqu'au système articulatoire, qui produit les sons du mot. Elle a également un effet sur la parole.


*Error coding the Malabi.*

*Many times an error may have more than one code. I these instances, there is a logic to follow in choosing which code. When more than 2 obvious errors have been made, the error as coded as 0, meaning it is too complex for an obvious logic.From the coded responses we calculated the norm errors for grades 6 and 7. See 'scripts/grade_norming.R'*
*Visual orthographic analysis*
*1) For any of the visual identifiable errors, if they can be attributed to a letter transposition or migration, than they should be coded as thus.*
*2) Right or left neglect errors are identified as not being attributed to letter transposition or migration, they should form words.Neglexia can also be identified as making all errors on either one side of words.
Sub-lexical Errors*
*1) Vowel dyslexia, highlighted by significantly more vowel than consonant errors. Appears to be due to poor vowel buffering in relation to consonants to the phonological output buffer. For this reason, it occurs mainly in non-word read, and in word reading when the lexical route is impaired.*
*2) Multi-Letter Phonological, also measured in sub-lexical reading. This manifests as difficulty in reading digrams, trigrams and rule-based grapheme-phoneme correspondences.This is the opposite of word reading, where the regularizing of grapheme-phoneme correspondences is linked to a deficit in lexical reading, known as surface dyslexia.*
*3) Lexical Errors*
*1) Surface dyslexia manifests as a difficulty in lexical access, meaning that children over regularize words that are irregular or have digrams or trigrams, rule based grapheme-phoneme correspondences and double letter rules.*
*Phonological Output Buffer*
*Phonological output buffer demonstrate difficulty in reading aloud long pseudowords or words with complex morphology, as well as a difficulties in their oral repetition. A working memory component that assembles the phonological representation of a word and stores it until the articulatory system, which produces the sounds of the word. It also effects speech.*
