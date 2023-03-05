OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
z q[7];
cx q[4], q[13];
cx q[11], q[4];
x q[3];
cx q[4], q[14];
cx q[8], q[10];
