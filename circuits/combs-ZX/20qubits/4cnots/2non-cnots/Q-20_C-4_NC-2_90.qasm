OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[3];
cx q[19], q[14];
cx q[8], q[5];
z q[13];
x q[0];
cx q[11], q[3];
