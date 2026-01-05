<header>

<!--
  <<< Author notes: Course header >>>
  Include a 1280×640 image, course title in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Add your open source license, GitHub uses MIT license.
-->

# Review pull requests

_Collaborate and work together on GitHub._

</header>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

## Step 1: Open a pull request

_Welcome to "Review pull requests"! :wave:_

Let's get started by opening a pull request.

**What is a pull request?**: Collaboration happens on a pull request. The pull request shows the changes in your branch to other people. This pull request is going to keep the changes you just made on your branch and propose applying them to the `main` branch.

### :keyboard: Activity: Create a pull request

1. Click on the **Pull requests** tab in your repository.
2. Click **New pull request**.
3. In the **base:** dropdown, make sure **main** is selected.
4. Select the **compare:** dropdown, and click `update-game`.
5. Click **Create pull request**.
6. Enter a title for your pull request: `Update the game over message`.
7. Enter a description for your pull request: `Update the game over message so people know how to play again!`
8. Click **Create pull request**.
9. Wait about 20 seconds then refresh this page (the one you're following instructions from). [GitHub Actions](https://docs.github.com/en/actions) will automatically update to the next step.

## Auto-commit quotidien (Windows)

Si vous voulez que ce dépôt fasse un commit automatique chaque jour sans exécuter de commandes manuellement, vous pouvez utiliser le Planificateur de tâches Windows (Task Scheduler) pour lancer un script PowerShell quotidiennement.

1) Script fourni

- J'ai ajouté un script: `scripts/random_commit.ps1` qui ajoute une ligne dans le fichier `.autocommit_log` et fait un `git commit`. Par défaut il crée 1 commit par exécution.

2) Exemple: créer une tâche qui s'exécute chaque jour à 10:00

Ouvrez PowerShell en administrateur (ou une session utilisateur qui a accès au dépôt) et exécutez la commande suivante en adaptant le chemin:

```powershell
schtasks /Create /SC DAILY /TN "AutoCommit" /TR "powershell.exe -NoProfile -ExecutionPolicy Bypass -File \"D:\\ITU_S5\\skills-review-pull-requests\\scripts\\random_commit.ps1\" -CommitsPerRun 1 -RepoPath \"D:\\ITU_S5\\skills-review-pull-requests\" -Push" /ST 10:00
```

Remarques:
- Changez `/ST 10:00` pour l'heure que vous souhaitez.
- L'option `-Push` pousse vers le remote après le commit si vous voulez que les commits apparaissent surGitHub automatiquement. Assurez-vous que les informations d'identification Git sont configurées pour l'utilisateur qui exécute la tâche (par exemple via des credentials stockés ou SSH agent disponible).

3) Alternatives et randomisation

- Si vous voulez que l'heure soit aléatoire chaque jour, le Planificateur de tâches ne propose pas directement une option "aléatoire". Deux approches possibles:
  - Créer une tâche qui s'exécute plusieurs fois par jour et faire en sorte que le script effectue seulement 1 commit par jour (par ex. en vérifiant un fichier `.last_autocommit_date`).
  - Laisser la tâche s'exécuter une fois par jour à une heure fixe (plus simple et fiable).

4) Dépannage rapide

- Si la tâche ne crée pas de commit, vérifiez que la tâche s'exécute avec le bon `RepoPath` et que l'utilisateur a les droits Git/credential nécessaires.
- Testez manuellement le script depuis PowerShell:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "D:\ITU_S5\skills-review-pull-requests\scripts\random_commit.ps1" -CommitsPerRun 1 -RepoPath "D:\ITU_S5\skills-review-pull-requests"
```


<footer>

<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---

Get help: [Post in our discussion board](https://github.com/orgs/skills/discussions/categories/review-pull-requests) &bull; [Review the GitHub status page](https://www.githubstatus.com/)


&copy; 2023 GitHub &bull; [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) &bull; [MIT License](https://gh.io/mit)

</footer>
