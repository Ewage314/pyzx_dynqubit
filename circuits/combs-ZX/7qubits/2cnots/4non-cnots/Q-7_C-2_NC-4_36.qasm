OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
z q[4];
cx q[3], q[2];
z q[6];
z q[3];
z q[1];
cx q[3], q[4];
