Note: �u����(SUDOKU)�v�͓�R���̓��{�ɂ�����o�^���W�ł��B


%%%%% �Z������ %%%%%

    Camera��ڑ����āAsudokuvideo_fn.m�̏�̕����Őݒ���m�F���āA
    >> sudokuvideo_fn.m
    �����s���܂��B���Ƃ̃p�Y�����J�����ɓ��Ă܂��B

    �A���S���Y���Ɋւ��ẮAsampleprocess.m�����s�B

%%%%% �������� %%%%%


�f���̖ړI:
    1. �J�������瓮����Ƃ�A���Ƃ̃p�Y�����摜�����œǂݍ���ŁA�������߂�B
    2. ���̉��̃C���[�W���A���̉摜�̏�ɏd�˂ĕ\������B

�K�v�Ȃ���:

    1. �m�C�Y�̏��Ȃ�web camera
    2. �҂�Ƃ̂����Ă���A���ĂȃC���[�W
    3. �傫�ȉe���Ȃ��A�\���ȏƖ�

�ڂ������s���@:
    �܂��A�p�Y���������邱�Ƃ��m�F
    >> edit SUDOKU_PUZZLE1.txt
    >> mysudokusolver SUDOKU_PUZZLE1.txt

    ���́A�r�f�I�ōs���F
    sudokuvideo_fn.m�̒��ɁA�J������parameter�Ȃǂ𒲐�����K�v������\��������܂��B
    (3-18�s�ڂŊm�F)
          >>sudokuvideo_fn.m
    �����s
    Figure����邩�Acontrol-c�Ŏ~�߂�B
    ������A�������[�s���G���[�ɂȂ�����Aimaqreset�����s

���ӁF
    �ǂ̃p�Y���ł������Ƃ����킯�ł͂���܂���B�p�Y���̊O�̘g�����Ăł��邱�ƂƁA
    �����̃t�H���g���L�ł��邱�ƂɈˑ����܂��B�����p�Y����T���K�v������܂��B

�t�@�C�����X�g:
1. sudokuvideo_fn.m:  ���C���̊֐��ŁA�摜��ǂݍ���ŁA�O�������s���܂��B
2. identifynumbers_fun.m:  �摜���e���v���[�g�f�[�^�Ɣ�r���āA���l�𔻕ʂ��܂��B
2. drawgraph.m:  �s�� M���󂯂āAsudoku_solver���Ăяo���āA�����e�[�u���ɕ\�����܂��B
4. sudoku_solver.m:  �s�� M���󂯂�, Sudoku�̉����v�Z���܂�
5. solution2image.m: �I�[�o���C�̂��߂̉摜�����܂��B
6. sudoku_fn_trace.m: solution2image���瓾��ꂽ�摜���A���ۂɃI�[�o���C����
7. TEMPLATEDATA.mat: �P�|�X�̐��l�̃T���v���摜