OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
z q[2];
z q[7];
cx q[6], q[1];
z q[3];
cx q[7], q[6];
