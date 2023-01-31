OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[6];
cx q[5], q[7];
z q[2];
cx q[4], q[3];
cx q[7], q[6];
cx q[4], q[9];
