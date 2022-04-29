// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[5];
cx q[9], q[5];
cx q[12], q[2];
cx q[10], q[14];
cx q[15], q[11];
cx q[14], q[6];
cx q[4], q[10];
cx q[7], q[9];
cx q[5], q[13];
cx q[3], q[0];
cx q[2], q[8];
cx q[9], q[1];
cx q[12], q[7];
cx q[11], q[5];
cx q[7], q[10];
cx q[3], q[13];
cx q[5], q[6];
cx q[15], q[6];
cx q[14], q[13];
cx q[13], q[11];
cx q[6], q[3];
cx q[9], q[8];
cx q[8], q[4];
cx q[4], q[6];
cx q[15], q[2];
cx q[13], q[2];
cx q[6], q[9];
cx q[2], q[12];
cx q[0], q[9];
cx q[3], q[11];
cx q[11], q[12];
cx q[0], q[4];
cx q[4], q[14];
cx q[14], q[9];
cx q[9], q[13];
cx q[10], q[7];
cx q[9], q[10];
cx q[1], q[4];
cx q[1], q[13];
cx q[6], q[5];
cx q[4], q[7];
cx q[15], q[2];
cx q[3], q[10];
cx q[8], q[14];
cx q[3], q[9];
cx q[9], q[1];
cx q[2], q[5];
cx q[5], q[11];
cx q[1], q[13];
cx q[7], q[14];
cx q[4], q[5];
cx q[3], q[1];
cx q[13], q[14];
cx q[6], q[10];
cx q[11], q[8];
cx q[2], q[6];
cx q[6], q[7];
cx q[15], q[10];
cx q[12], q[8];
cx q[9], q[2];
cx q[14], q[8];
cx q[7], q[12];
cx q[7], q[5];
cx q[0], q[14];
cx q[14], q[15];
cx q[13], q[6];
cx q[5], q[3];
cx q[10], q[7];
cx q[14], q[7];
cx q[5], q[2];
cx q[0], q[13];
cx q[10], q[15];
cx q[10], q[6];
cx q[7], q[15];
cx q[14], q[10];
cx q[1], q[14];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[3];
cx q[9], q[10];
cx q[15], q[14];
cx q[9], q[5];
cx q[0], q[1];
cx q[10], q[5];
cx q[13], q[1];
cx q[3], q[5];
cx q[2], q[3];
cx q[6], q[2];
cx q[0], q[11];
cx q[14], q[7];
cx q[5], q[12];
cx q[15], q[12];
cx q[10], q[7];
cx q[15], q[1];
cx q[12], q[14];
cx q[2], q[3];
cx q[3], q[1];
cx q[10], q[3];
cx q[3], q[15];
cx q[14], q[10];
cx q[2], q[10];
cx q[3], q[0];
cx q[1], q[15];
cx q[8], q[4];
cx q[8], q[11];
cx q[3], q[12];
cx q[4], q[1];
cx q[5], q[9];
cx q[2], q[12];
cx q[10], q[11];
cx q[4], q[15];
cx q[9], q[12];
cx q[12], q[10];
cx q[8], q[4];
cx q[11], q[14];
cx q[4], q[6];
cx q[5], q[6];
cx q[11], q[4];
cx q[5], q[2];
cx q[4], q[6];
cx q[4], q[11];
cx q[6], q[5];
cx q[6], q[4];
cx q[7], q[4];
cx q[11], q[0];
cx q[14], q[3];
cx q[5], q[13];
cx q[5], q[1];
