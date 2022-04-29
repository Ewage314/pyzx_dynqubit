// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[6];
cx q[10], q[6];
cx q[4], q[15];
cx q[17], q[4];
cx q[19], q[12];
cx q[6], q[13];
cx q[0], q[5];
cx q[6], q[18];
cx q[8], q[13];
cx q[5], q[14];
cx q[13], q[6];
cx q[9], q[3];
cx q[19], q[8];
cx q[19], q[11];
cx q[18], q[16];
cx q[12], q[7];
cx q[3], q[2];
cx q[4], q[13];
cx q[3], q[14];
cx q[12], q[7];
cx q[17], q[5];
cx q[8], q[0];
cx q[0], q[5];
cx q[2], q[16];
cx q[18], q[10];
cx q[9], q[18];
cx q[7], q[3];
cx q[10], q[15];
cx q[17], q[6];
cx q[7], q[12];
cx q[16], q[1];
cx q[13], q[2];
cx q[7], q[9];
cx q[15], q[7];
cx q[8], q[13];
cx q[6], q[3];
cx q[1], q[16];
cx q[6], q[19];
cx q[17], q[18];
cx q[10], q[5];
cx q[13], q[16];
cx q[7], q[2];
cx q[1], q[2];
cx q[11], q[4];
cx q[6], q[16];
cx q[14], q[4];
cx q[11], q[13];
cx q[8], q[15];
cx q[15], q[19];
cx q[19], q[7];
cx q[19], q[12];
cx q[9], q[2];
cx q[7], q[3];
cx q[1], q[15];
cx q[5], q[9];
cx q[14], q[17];
cx q[11], q[1];
cx q[9], q[8];
cx q[9], q[14];
cx q[1], q[16];
cx q[16], q[7];
cx q[15], q[18];
cx q[3], q[19];
cx q[10], q[13];
cx q[8], q[10];
cx q[9], q[17];
cx q[10], q[0];
cx q[11], q[4];
cx q[16], q[15];
cx q[5], q[17];
cx q[5], q[12];
cx q[12], q[18];
cx q[3], q[7];
cx q[1], q[13];
cx q[16], q[5];
cx q[6], q[15];
cx q[10], q[13];
cx q[1], q[18];
cx q[4], q[2];
cx q[2], q[12];
cx q[8], q[15];
cx q[1], q[2];
cx q[13], q[19];
cx q[19], q[4];
cx q[17], q[9];
cx q[4], q[9];
cx q[5], q[9];
cx q[11], q[16];
cx q[0], q[4];
cx q[13], q[8];
cx q[7], q[14];
cx q[8], q[13];
cx q[10], q[18];
cx q[19], q[13];
cx q[5], q[6];
cx q[10], q[3];
cx q[16], q[5];
cx q[8], q[14];
cx q[9], q[5];
cx q[11], q[17];
cx q[7], q[13];
cx q[12], q[14];
cx q[11], q[7];
cx q[2], q[7];
cx q[14], q[13];
cx q[18], q[1];
cx q[5], q[15];
cx q[8], q[11];
cx q[3], q[7];
cx q[6], q[10];
cx q[7], q[2];
cx q[12], q[15];
cx q[1], q[12];
cx q[1], q[12];
cx q[9], q[12];
cx q[17], q[1];
cx q[3], q[5];
cx q[8], q[17];
cx q[1], q[15];
cx q[7], q[18];
cx q[18], q[12];
cx q[2], q[12];
cx q[19], q[4];
cx q[11], q[19];
cx q[0], q[1];
cx q[2], q[4];
cx q[0], q[14];
cx q[4], q[14];
